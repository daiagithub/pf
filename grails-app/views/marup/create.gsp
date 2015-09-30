<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'marup.label', default: 'Marup')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>


</head>
<body>
	<!-- <a href="#create-marup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a> -->
	
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	
	<div id="create-marup" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${marupInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${marupInstance}" var="error">
					<li style="color: #a94442;"
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:marupInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="btn btn-primary"
					value="${message(code: 'default.button.create.marup.label', default: 'Save Marup')}" />
			</fieldset>
		</g:form>
	</div>

	<script>
		$(function(){
			$('.datepicker').datepicker({
				format: 'dd/mm/yyyy'
			});
		});
	</script>
</body>
</html>
