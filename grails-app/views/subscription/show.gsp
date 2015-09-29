
<%@ page import="org.pf.core.entity.Subscription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscription.label', default: 'Subscription')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subscription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subscription" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subscription">
			
				<g:if test="${subscriptionInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="subscription.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${subscriptionInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="subscription.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${subscriptionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.dateSubscribed}">
				<li class="fieldcontain">
					<span id="dateSubscribed-label" class="property-label"><g:message code="subscription.dateSubscribed.label" default="Date Subscribed" /></span>
					
						<span class="property-value" aria-labelledby="dateSubscribed-label"><g:formatDate date="${subscriptionInstance?.dateSubscribed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="subscription.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${subscriptionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.draws}">
				<li class="fieldcontain">
					<span id="draws-label" class="property-label"><g:message code="subscription.draws.label" default="Draws" /></span>
					
						<g:each in="${subscriptionInstance.draws}" var="d">
						<span class="property-value" aria-labelledby="draws-label"><g:link controller="draw" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="subscription.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${subscriptionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="subscription.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${subscriptionInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.marup}">
				<li class="fieldcontain">
					<span id="marup-label" class="property-label"><g:message code="subscription.marup.label" default="Marup" /></span>
					
						<span class="property-value" aria-labelledby="marup-label"><g:link controller="marup" action="show" id="${subscriptionInstance?.marup?.id}">${subscriptionInstance?.marup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="subscription.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${subscriptionInstance?.person?.id}">${subscriptionInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscriptionInstance?.slotSelection}">
				<li class="fieldcontain">
					<span id="slotSelection-label" class="property-label"><g:message code="subscription.slotSelection.label" default="Slot Selection" /></span>
					
						<span class="property-value" aria-labelledby="slotSelection-label"><g:link controller="slotSelection" action="show" id="${subscriptionInstance?.slotSelection?.id}">${subscriptionInstance?.slotSelection?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subscriptionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subscriptionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
