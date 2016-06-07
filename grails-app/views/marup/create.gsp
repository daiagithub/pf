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
	<div id="create-marup" class="content scaffold-create" role="main">
		<div class="row">
	        <div class="col-xs-4 col-sm-8">
	            <h2>
					<g:message code="create.label" args="[entityName]" default="New Marup" />
				</h2>
	        </div>

	        <div class="col-xs-4 col-sm-4" style="text-align: right; margin-top: 22px;">
	            
	        </div>              
	    </div>
		
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
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.marup.label', default: 'Save Marup')}" />
				<g:link url="[controller: 'home', action: 'index']" class="btn btn-default">Cancel</g:link>
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
