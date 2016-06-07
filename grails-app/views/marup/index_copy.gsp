
<%@ page import="org.pf.core.entity.Marup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marup.label', default: 'Marup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-marup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-marup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="contributionForMohori" title="${message(code: 'marup.contributionForMohori.label', default: 'Contribution For Mohori')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'marup.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'marup.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'marup.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="drawCycle" title="${message(code: 'marup.drawCycle.label', default: 'Draw Cycle')}" />
					
						<g:sortableColumn property="drawDate" title="${message(code: 'marup.drawDate.label', default: 'Draw Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${marupInstanceList}" status="i" var="marupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${marupInstance.id}">${fieldValue(bean: marupInstance, field: "contributionForMohori")}</g:link></td>
					
						<td>${fieldValue(bean: marupInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${marupInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: marupInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: marupInstance, field: "drawCycle")}</td>
					
						<td>${fieldValue(bean: marupInstance, field: "drawDate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${marupInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
