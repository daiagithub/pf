<head>
    <g:set var="layoutName" value="${grailsApplication.config.grails?.plugin?.springsecurity?.oauth?.layout}"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'signin account')}" />
    <meta name="layout" content="${layoutName ?: 'main'}"/>
    <title>Create or Link Account ${layoutName}</title>
   
</head>

<body>

    <div id="link-or-create-account" class="content scaffold-create" role="main">

        <h1>
            <g:message code="default.create.label" args="[entityName]" default="Create account" />
        </h1>

        <g:if test='${flash.error}'>
            <div class="errors">${flash.error}</div>
        </g:if>

        <h4><g:message code="springSecurity.oauth.registration.link.not.exists" default="You do not have an account with us." args="[session.springSecurityOAuthToken?.providerName]"/></h4>
        
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <br/>

        <g:hasErrors bean="${createAccountCommand}">
        <div class="errors">
            <g:renderErrors bean="${createAccountCommand}" as="list"/>
        </div>
        </g:hasErrors>

        <g:form action="createAccount" method="post" autocomplete="off"> 
            <fieldset class="form">
                
                <div class="row">
                    <div class="col-xs-4 col-sm-4">
                        <div class="form-group ${hasErrors(bean: createAccountCommand, field: 'username', 'has-error')} ">
                            <label for="username"> <g:message
                                    code="OAuthCreateAccountCommand.username.label" default="Username" />
                            </label>
                            <g:field class="form-control" type="text" name="username" value="${createAccountCommand?.username}" />
                        </div>
                    </div>

                    <div class="col-xs-4 col-sm-4">
                        <div class="form-group ${hasErrors(bean: createAccountCommand, field: 'password1', 'has-error')} ">
                            <label for="password1"> <g:message
                                    code="OAuthCreateAccountCommand.password1.label" default="Password" />
                            </label>
                            <g:passwordField class="form-control" name="password1" value="${createAccountCommand?.password1}" />
                        </div>
                    </div>

                    <div class="col-xs-4 col-sm-4">
                        <div class="form-group ${hasErrors(bean: createAccountCommand, field: 'password2', 'has-error')} ">
                            <label for="password2"> <g:message
                                    code="OAuthCreateAccountCommand.password2.label" default="Password re-type" />
                            </label>
                            <g:passwordField class="form-control" name="password2" value="${createAccountCommand?.password2}" />
                        </div>
                    </div>              
                </div>               
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton class="btn btn-primary" name="${message(code: 'springSecurity.oauth.registration.create.button', default: 'Create signin account')}"/>                
            </fieldset>
        </g:form>

    </div>

<div class='body' style="padding: 15px;">
    
    

    

    <br/>

    <!--
    <g:hasErrors bean="${linkAccountCommand}">
    <div class="errors">
        <g:renderErrors bean="${linkAccountCommand}" as="list"/>
    </div>
    </g:hasErrors>

    <g:form action="linkAccount" method="post" autocomplete="off">
        <fieldset>
            <legend><g:message code="springSecurity.oauth.registration.login.legend" default="Link to an existing account"/></legend>
            <div class="fieldcontain ${hasErrors(bean: linkAccountCommand, field: 'username', 'error')} ">
                <label for='username'><g:message code="OAuthLinkAccountCommand.username.label" default="Username"/>:</label>
                <g:textField name='username' value='${linkAccountCommand?.username}'/>
            </div>
            <div class="fieldcontain ${hasErrors(bean: linkAccountCommand, field: 'password', 'error')} ">
                <label for='password'><g:message code="OAuthLinkAccountCommand.password.label" default="Password"/>:</label>
                <g:passwordField name='password' value='${linkAccountCommand?.password}'/>
            </div>
            <g:submitButton name="${message(code: 'springSecurity.oauth.registration.login.button', default: 'Login')}"/>
        </fieldset>
    </g:form>

    <br/>
-->
    <g:link controller="login" action="auth"><g:message code="springSecurity.oauth.registration.back" default="<-Back to login page"/></g:link>
</div>

</body>
