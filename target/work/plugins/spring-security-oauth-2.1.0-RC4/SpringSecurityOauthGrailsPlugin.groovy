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
import grails.plugin.springsecurity.ReflectionUtils
import grails.plugin.springsecurity.SpringSecurityUtils

/**
 * @author <a href='mailto:cazacugmihai@gmail.com'>Mihai Cazacu</a>
 * @author <a href='mailto:enrico@comiti.name'>Enrico Comiti</a>
 * @author <a href='mailto:donbeave@gmail.com'>Alexey Zhokhov</a>
 */
class SpringSecurityOauthGrailsPlugin {

    def version = '2.1.0-RC4'
    def grailsVersion = '2.0 > *'

    def loadAfter = ['springSecurityCore']

    def pluginExcludes = [
            'web-app/*'
    ]

    def title = 'Spring Security OAuth plugin'
    def description = '''Adds OAuth-based authentication to the
[Spring Security plugin|http://grails.org/plugin/spring-security-core] using the
[OAuth plugin|http://grails.org/plugin/oauth]. This plugin provides an OAuth realm that can easily be integrated
into existing applications and a host of utility functions to make things like "log in with Twitter" almost trivial.'''

    def documentation = 'http://grails.org/plugin/spring-security-oauth'

    def license = 'APACHE'
    def organization = [name: 'Macrobit Software', url: 'http://macrobit.ro/']
    def developers = [
            [name: 'Mihai Cazacu', email: 'cazacugmihai@gmail.com'],
            [name: 'Enrico Comiti', email: 'enrico@comiti.name'],
            [name: 'Alexey Zhokhov', email: 'donbeave@gmail.com']]
    def issueManagement = [system: 'GITHUB', url: 'https://github.com/enr/grails-spring-security-oauth/issues']
    def scm = [url: 'https://github.com/enr/grails-spring-security-oauth/']

    def doWithSpring = {
        ReflectionUtils.application = application

        if (application.warDeployed) {
            // need to reset here since web.xml was already built, so
            // doWithWebDescriptor isn't called when deployed as war
            SpringSecurityUtils.resetSecurityConfig()
        }

        SpringSecurityUtils.application = application

        def coreConf = SpringSecurityUtils.securityConfig
        boolean printStatusMessages = (coreConf.printStatusMessages instanceof Boolean) ? coreConf.printStatusMessages : true
        if (!coreConf || !coreConf.active) {
            if (printStatusMessages) {
                println '\n\nSpring Security is disabled, not loading Spring Security OAuth plugin\n\n'
            }
            return
        }

        if (printStatusMessages) {
            println '\nConfiguring Spring Security OAuth ...'
        }

        SpringSecurityUtils.loadSecondaryConfig 'DefaultSpringSecurityOAuthConfig'

        if (printStatusMessages) {
            println '... finished configuring Spring Security OAuth\n'
        }
    }

}
