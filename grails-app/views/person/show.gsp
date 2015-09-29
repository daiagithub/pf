
<%@ page import="org.pf.core.entity.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.addressLine1}">
				<li class="fieldcontain">
					<span id="addressLine1-label" class="property-label"><g:message code="person.addressLine1.label" default="Address Line1" /></span>
					
						<span class="property-value" aria-labelledby="addressLine1-label"><g:fieldValue bean="${personInstance}" field="addressLine1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.addressLine2}">
				<li class="fieldcontain">
					<span id="addressLine2-label" class="property-label"><g:message code="person.addressLine2.label" default="Address Line2" /></span>
					
						<span class="property-value" aria-labelledby="addressLine2-label"><g:fieldValue bean="${personInstance}" field="addressLine2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="person.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:fieldValue bean="${personInstance}" field="area"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="person.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${personInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="person.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${personInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="person.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${personInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="person.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${personInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="person.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${personInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="person.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="person.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="person.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${personInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="person.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${personInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.marups}">
				<li class="fieldcontain">
					<span id="marups-label" class="property-label"><g:message code="person.marups.label" default="Marups" /></span>
					
						<g:each in="${personInstance.marups}" var="m">
						<span class="property-value" aria-labelledby="marups-label"><g:link controller="marup" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.pinCode}">
				<li class="fieldcontain">
					<span id="pinCode-label" class="property-label"><g:message code="person.pinCode.label" default="Pin Code" /></span>
					
						<span class="property-value" aria-labelledby="pinCode-label"><g:fieldValue bean="${personInstance}" field="pinCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.slotSelections}">
				<li class="fieldcontain">
					<span id="slotSelections-label" class="property-label"><g:message code="person.slotSelections.label" default="Slot Selections" /></span>
					
						<g:each in="${personInstance.slotSelections}" var="s">
						<span class="property-value" aria-labelledby="slotSelections-label"><g:link controller="slotSelection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="person.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${personInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.subscriptions}">
				<li class="fieldcontain">
					<span id="subscriptions-label" class="property-label"><g:message code="person.subscriptions.label" default="Subscriptions" /></span>
					
						<g:each in="${personInstance.subscriptions}" var="s">
						<span class="property-value" aria-labelledby="subscriptions-label"><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="person.users.label" default="Users" /></span>
					
						<g:each in="${personInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
