/*
 * Copyright 2012 the original author or authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package grails.plugin.springsecurity.oauth

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.web.servlet.ModelAndView
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException

import org.pf.core.entity.Person;
import org.pf.core.secure.OAuthID;

/**
 * Simple controller for handling OAuth authentication and integrating it
 * into Spring Security.
 */
class SpringSecurityOAuthController {

    public static final String SPRING_SECURITY_OAUTH_TOKEN = 'springSecurityOAuthToken'

    def oauthService
    def springSecurityService
    def springSecurityOAuthService
    def authenticationManager

    /**
     * This can be used as a callback for a successful OAuth authentication
     * attempt.
     * It logs the associated user in if he or she has an internal
     * Spring Security account and redirects to <tt>targetUri</tt> (provided as a URL
     * parameter or in the session). Otherwise it redirects to a URL for
     * linking OAuth identities to Spring Security accounts. The application must implement
     * the page and provide the associated URL via the <tt>oauth.registration.askToLinkOrCreateAccountUri</tt>
     * configuration setting.
     *
     * "/oauth/$provider/success"(controller: "springSecurityOAuth", action: "onSuccess")
     */
    def onSuccess(String provider) {
        // Validate the 'provider' URL. Any errors here are either misconfiguration
        // or web crawlers (or malicious users).
        println "onSuccess..."
        if (!provider) {
            log.warn "The Spring Security OAuth callback URL must include the 'provider' URL parameter"
            throw new OAuthLoginException("The Spring Security OAuth callback URL must include the 'provider' URL parameter")
        }

        def sessionKey = oauthService.findSessionKeyForAccessToken(provider)
        if (!session[sessionKey]) {
            log.warn "No OAuth token in the session for provider '${provider}'"
            throw new OAuthLoginException("Authentication error for provider '${provider}'")
        }
        // Create the relevant authentication token and attempt to log in.
        OAuthToken oAuthToken = springSecurityOAuthService.createAuthToken(provider, session[sessionKey])

        println "S ID: " + oAuthToken.socialId 
        if (oAuthToken.principal instanceof GrailsUser) {
            //Add one more custom check. Authenticate only when there is a OAuthID present in the app database.
            /*
            */
            //There seems to be an issue, OAuthID got created with no clue without an User resord
            authenticateAndRedirect(oAuthToken, getDefaultTargetUrl())
        } else {
            // This OAuth account hasn't been registered against an internal
            // account yet. Give the oAuthID the opportunity to create a new
            // internal account or link to an existing one.
            session[SPRING_SECURITY_OAUTH_TOKEN] = oAuthToken

            def redirectUrl = springSecurityOAuthService.getAskToLinkOrCreateAccountUri()
            if (!redirectUrl) {
                log.warn "grails.plugin.springsecurity.oauth.registration.askToLinkOrCreateAccountUri configuration option must be set"
                throw new OAuthLoginException('Internal error')
            }
            log.debug "Redirecting to askToLinkOrCreateAccountUri: ${redirectUrl}"
            redirect(redirectUrl instanceof Map ? redirectUrl : [uri: redirectUrl])
        }
    }

    def onFailure(String provider) {
        // TODO: put it in i18n messages file
        //flash.message = "book.delete.message"
        //flash.args = ["The Stand"]
        flash.default = "Error authenticating with ${provider}"
        log.warn "Error authenticating with external provider ${provider}"
        authenticateAndRedirect(null, getDefaultTargetUrl())
    }

    def askToLinkOrCreateAccount() {
        if (springSecurityService.isLoggedIn()) {
            def currentUser = springSecurityService.getCurrentUser()
            OAuthToken oAuthToken = session[SPRING_SECURITY_OAUTH_TOKEN]
            if (!oAuthToken) {
                log.warn "askToLinkOrCreateAccount: OAuthToken not found in session"
                throw new OAuthLoginException('Authentication error')
            }
            currentUser.addToOAuthIDs(provider: oAuthToken.providerName, accessToken: oAuthToken.socialId, user: currentUser)
            if (currentUser.validate() && currentUser.save()) {
                oAuthToken = springSecurityOAuthService.updateOAuthToken(oAuthToken, currentUser)
                authenticateAndRedirect(oAuthToken, getDefaultTargetUrl())
                return
            }
        }
        return new ModelAndView("/springSecurityOAuth/askToLinkOrCreateAccount", [:])
    }

    /**
     * Associates an OAuthID with an existing account. Needs the user's password to ensure
     * that the user owns that account, and authenticates to verify before linking.
     */
    def linkAccount(OAuthLinkAccountCommand command) {
        OAuthToken oAuthToken = session[SPRING_SECURITY_OAUTH_TOKEN]
        if (!oAuthToken) {
            log.warn "linkAccount: OAuthToken not found in session"
            throw new OAuthLoginException('Authentication error')
        }
        if (request.post) {
            if (!authenticationIsValid(command.username, command.password)) {
                log.info "Authentication error for use ${command.username}"
                command.errors.rejectValue("username", "OAuthLinkAccountCommand.authentication.error")
                render view: 'askToLinkOrCreateAccount', model: [linkAccountCommand: command]
                return
            }
            def commandValid = command.validate()
            def User = springSecurityOAuthService.lookupUserClass()
            boolean linked = commandValid && User.withTransaction { status ->
                //def user = User.findByUsernameAndPassword(command.username, springSecurityService.encodePassword(command.password))
                def user = User.findByUsername(command.username)
                if (user) {
                    user.addToOAuthIDs(provider: oAuthToken.providerName, accessToken: oAuthToken.socialId, user: user)
                    if (user.validate() && user.save()) {
                        oAuthToken = springSecurityOAuthService.updateOAuthToken(oAuthToken, user)
                        return true
                    } else {
                        return false
                    }
                } else {
                    command.errors.rejectValue("username", "OAuthLinkAccountCommand.username.not.exists")
                }
                status.setRollbackOnly()
                return false
            }
            if (linked) {
                authenticateAndRedirect(oAuthToken, getDefaultTargetUrl())
                return
            }
        }
        render view: 'askToLinkOrCreateAccount', model: [linkAccountCommand: command]
        return
    }

    private boolean authenticationIsValid(String username, String password) {
        boolean valid = true
        try {
           authenticationManager.authenticate new UsernamePasswordAuthenticationToken(username, password)
        } catch (AuthenticationException e) {
           valid = false
        } 
        return valid
    }

    def createAccount(OAuthCreateAccountCommand command) {
        OAuthToken oAuthToken = session[SPRING_SECURITY_OAUTH_TOKEN]
        if (!oAuthToken) {
            log.warn "createAccount: OAuthToken not found in session"
            throw new OAuthLoginException('Authentication error')
        }
        if (request.post) {
            if (!springSecurityService.loggedIn) {
                def config = SpringSecurityUtils.securityConfig
                def commandValid = command.validate()
                def User = springSecurityOAuthService.lookupUserClass()
                boolean created = commandValid && User.withTransaction { status ->
                    def user = springSecurityOAuthService.lookupUserClass().newInstance()
                    //User user = new User(username: command.username, password: command.password1, enabled: true)
                    user.username = command.username
                    user.password = command.password1
                    user.enabled = true
                    user.addToOAuthIDs(provider: oAuthToken.providerName, accessToken: oAuthToken.socialId, user: user)
                    //Add new person
                    Person person = new Person(firstName: user.username, createdBy: user.username, lastUpdatedBy: user.username).save()
                    person.addToUsers(user)  
                    // updateUser(user, oAuthToken)
                    if (!user.validate() || !user.save()) {
                        status.setRollbackOnly()
                        false
                    }
                    def UserRole = springSecurityOAuthService.lookupUserRoleClass()
                    def Role = springSecurityOAuthService.lookupRoleClass()
                    def roles = springSecurityOAuthService.getRoleNames()
                    for (roleName in roles) {
                        UserRole.create user, Role.findByAuthority(roleName)
                    }
                    oAuthToken = springSecurityOAuthService.updateOAuthToken(oAuthToken, user)
                    true
                }
                if (created) {
                    authenticateAndRedirect(oAuthToken, getDefaultTargetUrl())
                    return
                }
            }
        }
        render view: 'askToLinkOrCreateAccount', model: [createAccountCommand: command]
    }

    protected Map getDefaultTargetUrl() {
        def config = SpringSecurityUtils.securityConfig
        def savedRequest = SpringSecurityUtils.getSavedRequest(session)
        def defaultUrlOnNull = '/'
        if (savedRequest && !config.successHandler.alwaysUseDefault) {
            return [url: (savedRequest.redirectUrl ?: defaultUrlOnNull)]
        }

        println "URI: " +config.successHandler.defaultTargetUrl
        return [uri: (config.successHandler.defaultTargetUrl ?: defaultUrlOnNull)]
    }

    protected void authenticateAndRedirect(OAuthToken oAuthToken, redirectUrl) {
        session.removeAttribute SPRING_SECURITY_OAUTH_TOKEN
        SecurityContextHolder.context.authentication = oAuthToken
        redirect(redirectUrl instanceof Map ? redirectUrl : [uri: redirectUrl])
    }

}

class OAuthCreateAccountCommand {

    def springSecurityOAuthService

    String username
    String password1
    String password2

    static constraints = {
        username blank: false, minSize: 3, validator: { String username, command ->
            if (command.springSecurityOAuthService.usernameTaken(username)) {
                return 'OAuthCreateAccountCommand.username.error.unique'
            }
        }
        password1 blank: false, minSize: 8, maxSize: 64, validator: { password1, command ->
            if (command.username && command.username == password1) {
                return 'OAuthCreateAccountCommand.password.error.username'
            }

            if (password1 && password1.length() >= 8 && password1.length() <= 64 &&
                    (!password1.matches('^.*\\p{Alpha}.*$') ||
                     !password1.matches('^.*\\p{Digit}.*$') ||
                     !password1.matches('^.*[!@#$%^&].*$'))) {
                return 'OAuthCreateAccountCommand.password.error.strength'
            }
        }
        password2 nullable: true, blank: true, validator: { password2, command ->
            if (command.password1 != password2) {
                return 'OAuthCreateAccountCommand.password.error.mismatch'
            }
        }
    }
}

class OAuthLinkAccountCommand {

    String username
    String password

    static constraints = {
        username blank: false
        password blank: false
    }

}
