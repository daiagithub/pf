
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
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
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
	<div id="list-marup" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-condensed"><%--
			<thead>
				<tr>
					<g:sortableColumn property="subscriber?.firstName"
						title="Mohori" />
						
					<td >Address</td>
						
					<g:sortableColumn property="installment"
						title="${message(code: 'marup.installment.label', default: 'Installment')}" />
						
					<g:sortableColumn property="noOfParticipants"
						title="${message(code: 'marup.noOfParticipants.label', default: 'noOfParticipants')}" />
					
					<g:sortableColumn property="preferredVenue"
						title="${message(code: 'marup.preferredVenue.label', default: 'preferredVenue')}" />
											
					

					<g:sortableColumn property="createdBy"
						title="${message(code: 'marup.createdBy.label', default: 'Created By')}" />

					<g:sortableColumn property="dateCreated"
						title="${message(code: 'marup.dateCreated.label', default: 'Date Created')}" />

					<g:sortableColumn property="description"
						title="${message(code: 'marup.description.label', default: 'Description')}" />

					<g:sortableColumn property="drawCycle"
						title="${message(code: 'marup.drawCycle.label', default: 'Draw Cycle')}" />

					<g:sortableColumn property="drawDate"
						title="${message(code: 'marup.drawDate.label', default: 'Draw Date')}" />

				</tr>
			</thead>
			--%>
			<tbody>
				<g:each in="${marupInstanceList}" status="i" var="marupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							${marupInstance?.owner?.firstName} ${marupInstance?.owner?.lastName}
						</td>
						
						<td>
							${marupInstance?.owner?.area}${marupInstance?.owner?.area?", ":""}${marupInstance?.owner?.city}
						</td>
						
						<td>
							${fieldValue(bean: marupInstance, field: "sumAssured")}
						</td>
						
						<td>
							${marupInstance?.subscriptions?.size?:0}/${marupInstance?.noOfParticipants?:"NA"}
						</td>
						
						<td><g:formatDate date="${marupInstance.dateCreated}" /></td>
						<td><i class="glyphicon glyphicon-comment"></i></td>
						<td style="width: 100px; text-align: right;"><g:link action="bookaslot" controller="slotSelection" id="${marupInstance.id}">Book a slot</g:link></td>

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
