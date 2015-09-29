
<%@ page import="org.pf.core.entity.Subscription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subscription.label', default: 'Subscription')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subscription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subscription" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdBy" title="${message(code: 'subscription.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'subscription.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dateSubscribed" title="${message(code: 'subscription.dateSubscribed.label', default: 'Date Subscribed')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'subscription.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'subscription.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'subscription.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subscriptionInstanceList}" status="i" var="subscriptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subscriptionInstance.id}">${fieldValue(bean: subscriptionInstance, field: "createdBy")}</g:link></td>
					
						<td><g:formatDate date="${subscriptionInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${subscriptionInstance.dateSubscribed}" /></td>
					
						<td>${fieldValue(bean: subscriptionInstance, field: "description")}</td>
					
						<td><g:formatDate date="${subscriptionInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: subscriptionInstance, field: "lastUpdatedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subscriptionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
