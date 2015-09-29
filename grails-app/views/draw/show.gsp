
<%@ page import="org.pf.core.entity.Draw" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'draw.label', default: 'Draw')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-draw" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-draw" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list draw">
			
				<g:if test="${drawInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="draw.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${drawInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="draw.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${drawInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.dateDrawn}">
				<li class="fieldcontain">
					<span id="dateDrawn-label" class="property-label"><g:message code="draw.dateDrawn.label" default="Date Drawn" /></span>
					
						<span class="property-value" aria-labelledby="dateDrawn-label"><g:formatDate date="${drawInstance?.dateDrawn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="draw.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${drawInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.drawStatus}">
				<li class="fieldcontain">
					<span id="drawStatus-label" class="property-label"><g:message code="draw.drawStatus.label" default="Draw Status" /></span>
					
						<span class="property-value" aria-labelledby="drawStatus-label"><g:fieldValue bean="${drawInstance}" field="drawStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="draw.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${drawInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="draw.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${drawInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.marup}">
				<li class="fieldcontain">
					<span id="marup-label" class="property-label"><g:message code="draw.marup.label" default="Marup" /></span>
					
						<span class="property-value" aria-labelledby="marup-label"><g:link controller="marup" action="show" id="${drawInstance?.marup?.id}">${drawInstance?.marup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.subscription}">
				<li class="fieldcontain">
					<span id="subscription-label" class="property-label"><g:message code="draw.subscription.label" default="Subscription" /></span>
					
						<span class="property-value" aria-labelledby="subscription-label"><g:link controller="subscription" action="show" id="${drawInstance?.subscription?.id}">${drawInstance?.subscription?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${drawInstance?.totalAmount}">
				<li class="fieldcontain">
					<span id="totalAmount-label" class="property-label"><g:message code="draw.totalAmount.label" default="Total Amount" /></span>
					
						<span class="property-value" aria-labelledby="totalAmount-label"><g:fieldValue bean="${drawInstance}" field="totalAmount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:drawInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${drawInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
