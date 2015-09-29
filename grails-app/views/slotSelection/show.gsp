
<%@ page import="org.pf.core.entity.SlotSelection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'slotSelection.label', default: 'SlotSelection')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-slotSelection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-slotSelection" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list slotSelection">
			
				<g:if test="${slotSelectionInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="slotSelection.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${slotSelectionInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.dateBooked}">
				<li class="fieldcontain">
					<span id="dateBooked-label" class="property-label"><g:message code="slotSelection.dateBooked.label" default="Date Booked" /></span>
					
						<span class="property-value" aria-labelledby="dateBooked-label"><g:formatDate date="${slotSelectionInstance?.dateBooked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="slotSelection.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${slotSelectionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="slotSelection.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${slotSelectionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="slotSelection.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${slotSelectionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="slotSelection.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${slotSelectionInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.marup}">
				<li class="fieldcontain">
					<span id="marup-label" class="property-label"><g:message code="slotSelection.marup.label" default="Marup" /></span>
					
						<span class="property-value" aria-labelledby="marup-label"><g:link controller="marup" action="show" id="${slotSelectionInstance?.marup?.id}">${slotSelectionInstance?.marup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="slotSelection.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${slotSelectionInstance?.person?.id}">${slotSelectionInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.selectionStatus}">
				<li class="fieldcontain">
					<span id="selectionStatus-label" class="property-label"><g:message code="slotSelection.selectionStatus.label" default="Selection Status" /></span>
					
						<span class="property-value" aria-labelledby="selectionStatus-label"><g:fieldValue bean="${slotSelectionInstance}" field="selectionStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.slotName}">
				<li class="fieldcontain">
					<span id="slotName-label" class="property-label"><g:message code="slotSelection.slotName.label" default="Slot Name" /></span>
					
						<span class="property-value" aria-labelledby="slotName-label"><g:fieldValue bean="${slotSelectionInstance}" field="slotName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slotSelectionInstance?.subscriptions}">
				<li class="fieldcontain">
					<span id="subscriptions-label" class="property-label"><g:message code="slotSelection.subscriptions.label" default="Subscriptions" /></span>
					
						<g:each in="${slotSelectionInstance.subscriptions}" var="s">
						<span class="property-value" aria-labelledby="subscriptions-label"><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:slotSelectionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${slotSelectionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
