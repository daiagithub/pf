
<%@ page import="org.pf.core.entity.SlotSelection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'slotSelection.label', default: 'SlotSelection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-slotSelection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-slotSelection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdBy" title="${message(code: 'slotSelection.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateBooked" title="${message(code: 'slotSelection.dateBooked.label', default: 'Date Booked')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'slotSelection.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'slotSelection.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'slotSelection.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'slotSelection.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${slotSelectionInstanceList}" status="i" var="slotSelectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${slotSelectionInstance.id}">${fieldValue(bean: slotSelectionInstance, field: "createdBy")}</g:link></td>
					
						<td><g:formatDate date="${slotSelectionInstance.dateBooked}" /></td>
					
						<td><g:formatDate date="${slotSelectionInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: slotSelectionInstance, field: "description")}</td>
					
						<td><g:formatDate date="${slotSelectionInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: slotSelectionInstance, field: "lastUpdatedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${slotSelectionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
