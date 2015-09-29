
<%@ page import="org.pf.core.entity.Draw" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'draw.label', default: 'Draw')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-draw" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-draw" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdBy" title="${message(code: 'draw.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'draw.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dateDrawn" title="${message(code: 'draw.dateDrawn.label', default: 'Date Drawn')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'draw.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="drawStatus" title="${message(code: 'draw.drawStatus.label', default: 'Draw Status')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'draw.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${drawInstanceList}" status="i" var="drawInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${drawInstance.id}">${fieldValue(bean: drawInstance, field: "createdBy")}</g:link></td>
					
						<td><g:formatDate date="${drawInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${drawInstance.dateDrawn}" /></td>
					
						<td>${fieldValue(bean: drawInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: drawInstance, field: "drawStatus")}</td>
					
						<td><g:formatDate date="${drawInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${drawInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
