<%@ page import="org.pf.core.entity.Marup"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'marup.label', default: 'Marup')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">
	        <div class="col-xs-4 col-sm-8">
	            <h2>
					<g:message code="recent.list.label" args="[entityName]" default="Marups" />
				</h2>
	        </div>

	                     
	    </div>
	<g:form url="[action:'search',controller:'marup']">
		<fieldset class="form">
			<div class="row">
				<div class="col-xs-6 col-sm-4">
					<div class="form-group">
						<label for="sumAssured"> <g:message
								code="marup.sumAssured.label" default="Sum Assured" />
						</label>
						<g:field class="form-control" type="number" name="sumAssured"
							value="${sumAssured}" />
					</div>
				</div>
				<div class="col-xs-6 col-sm-4">
					<div class="form-group">
						<label for="noOfParticipants"> <g:message
								code="marup.noOfParticipants.label" default="noOfParticipants" />
						</label>
						<g:field class="form-control" type="number" name="noOfParticipants"
							value="${noOfParticipants}" />
					</div>
				</div>
				<div class="col-xs-6 col-sm-4">
					<div class="form-group">
						<label for="preferredVenue"> <g:message
								code="marup.preferredVenue.label" default="Location" />
						</label>
						<g:textField class="form-control" name="preferredVenue"
							value="${preferredVenue}" />
					</div>
				</div>
			</div>
		</fieldset>

		<fieldset class="buttons">
			<g:submitButton name="search" class="btn btn-primary"
				value="Search" />
		</fieldset>
	</g:form>
	<g:render template="../marup/searchform" />
</body>
</html>
