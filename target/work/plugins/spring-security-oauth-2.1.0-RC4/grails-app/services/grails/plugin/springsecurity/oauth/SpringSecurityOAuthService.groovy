package grails.plugin.springsecurity.oauth

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.userdetails.GormUserDetailsService
import grails.plugin.springsecurity.userdetails.GrailsUser

import org.springframework.security.core.authority.SimpleGrantedAuthority

/**
 * Service providing most of the plugin business logic.
 */
class SpringSecurityOAuthService {

    def grailsApplication

    OAuthToken createAuthToken(providerName, scribeToken) {
        def providerService = grailsApplication.mainContext.getBean("${providerName}SpringSecurityOAuthService")
        OAuthToken oAuthToken = providerService.createAuthToken(scribeToken)
        def OAuthID = lookupOAuthIdClass()
        def oAuthID = OAuthID.findByProviderAndAccessToken(oAuthToken.providerName, oAuthToken.socialId)
        if (oAuthID) {
            updateOAuthToken(oAuthToken, oAuthID.user)
        }
        return oAuthToken
    }

    OAuthToken updateOAuthToken(OAuthToken oAuthToken, user) {
        def conf = SpringSecurityUtils.securityConfig

        // user

        String usernamePropertyName = conf.userLookup.usernamePropertyName
        String passwordPropertyName = conf.userLookup.passwordPropertyName
        String enabledPropertyName = conf.userLookup.enabledPropertyName
        String accountExpiredPropertyName = conf.userLookup.accountExpiredPropertyName
        String accountLockedPropertyName = conf.userLookup.accountLockedPropertyName
        String passwordExpiredPropertyName = conf.userLookup.passwordExpiredPropertyName

        String username = user."${usernamePropertyName}"
        String password = user."${passwordPropertyName}"
        boolean enabled = enabledPropertyName ? user."${enabledPropertyName}" : true
        boolean accountExpired = accountExpiredPropertyName ? user."${accountExpiredPropertyName}" : false
        boolean accountLocked = accountLockedPropertyName ? user."${accountLockedPropertyName}" : false
        boolean passwordExpired = passwordExpiredPropertyName ? user."${passwordExpiredPropertyName}" : false

        // authorities

        String authoritiesPropertyName = conf.userLookup.authoritiesPropertyName
        String authorityPropertyName = conf.authority.nameField
        Collection<?> userAuthorities = user."${authoritiesPropertyName}"
        def authorities = userAuthorities.collect { new SimpleGrantedAuthority(it."${authorityPropertyName}") }

        oAuthToken.principal = new GrailsUser(username, password, enabled, !accountExpired, !passwordExpired,
                !accountLocked, authorities ?: [GormUserDetailsService.NO_ROLE], user.id)
        oAuthToken.authorities = authorities
        oAuthToken.authenticated = true

        return oAuthToken
    }

    /**
     * Returns if a user with the given username exists in database.
     */
    boolean usernameTaken(String username) {
        def User = lookupUserClass()
        User.withNewSession { session ->
            if (username && User.countByUsername(username)) {
                return 'OAuthCreateAccountCommand.username.error.unique'
            }
        }
    }

    def getAskToLinkOrCreateAccountUri() {
        def askToLinkOrCreateAccountUri = grailsApplication.config.grails.plugin.springsecurity.oauth.registration.askToLinkOrCreateAccountUri ?: '/oauth/askToLinkOrCreateAccount'
        return askToLinkOrCreateAccountUri
    }

    def getRoleNames() {
        def roleNames = grailsApplication.config.grails.plugin.springsecurity.oauth.registration.roleNames ?: ['ROLE_USER']
        return roleNames
    }

    protected String lookupUserClassName() {
        SpringSecurityUtils.securityConfig.userLookup.userDomainClassName
    }

    protected Class<?> lookupUserClass() {
        grailsApplication.getDomainClass(lookupUserClassName()).clazz
    }

    protected String lookupRoleClassName() {
        SpringSecurityUtils.securityConfig.authority.className
    }

    protected Class<?> lookupRoleClass() {
        grailsApplication.getDomainClass(lookupRoleClassName()).clazz
    }

    protected String lookupUserRoleClassName() {
        SpringSecurityUtils.securityConfig.userLookup.authorityJoinClassName
    }

    protected Class<?> lookupUserRoleClass() {
        grailsApplication.getDomainClass(lookupUserRoleClassName()).clazz
    }

    protected String lookupOAuthIdClassName() {
        def domainClass = grailsApplication.config.grails.plugin.springsecurity.oauth.domainClass ?: 'OAuthID'
        return domainClass
    }

    protected Class<?> lookupOAuthIdClass() {
        grailsApplication.getDomainClass(lookupOAuthIdClassName()).clazz
    }
}
