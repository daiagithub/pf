
<%@ page import="org.pf.core.entity.Marup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marup.label', default: 'Marup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-marup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-marup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list marup">
			
				<g:if test="${marupInstance?.contributionForMohori}">
				<li class="fieldcontain">
					<span id="contributionForMohori-label" class="property-label"><g:message code="marup.contributionForMohori.label" default="Contribution For Mohori" /></span>
					
						<span class="property-value" aria-labelledby="contributionForMohori-label"><g:fieldValue bean="${marupInstance}" field="contributionForMohori"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="marup.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${marupInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="marup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${marupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="marup.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${marupInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.drawCycle}">
				<li class="fieldcontain">
					<span id="drawCycle-label" class="property-label"><g:message code="marup.drawCycle.label" default="Draw Cycle" /></span>
					
						<span class="property-value" aria-labelledby="drawCycle-label"><g:fieldValue bean="${marupInstance}" field="drawCycle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.drawDate}">
				<li class="fieldcontain">
					<span id="drawDate-label" class="property-label"><g:message code="marup.drawDate.label" default="Draw Date" /></span>
					
						<span class="property-value" aria-labelledby="drawDate-label"><g:fieldValue bean="${marupInstance}" field="drawDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.drawType}">
				<li class="fieldcontain">
					<span id="drawType-label" class="property-label"><g:message code="marup.drawType.label" default="Draw Type" /></span>
					
						<span class="property-value" aria-labelledby="drawType-label"><g:fieldValue bean="${marupInstance}" field="drawType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.draws}">
				<li class="fieldcontain">
					<span id="draws-label" class="property-label"><g:message code="marup.draws.label" default="Draws" /></span>
					
						<g:each in="${marupInstance.draws}" var="d">
						<span class="property-value" aria-labelledby="draws-label"><g:link controller="draw" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.installment}">
				<li class="fieldcontain">
					<span id="installment-label" class="property-label"><g:message code="marup.installment.label" default="Installment" /></span>
					
						<span class="property-value" aria-labelledby="installment-label"><g:fieldValue bean="${marupInstance}" field="installment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.interest}">
				<li class="fieldcontain">
					<span id="interest-label" class="property-label"><g:message code="marup.interest.label" default="Interest" /></span>
					
						<span class="property-value" aria-labelledby="interest-label"><g:fieldValue bean="${marupInstance}" field="interest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="marup.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${marupInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="marup.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${marupInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.noOfParticipants}">
				<li class="fieldcontain">
					<span id="noOfParticipants-label" class="property-label"><g:message code="marup.noOfParticipants.label" default="No Of Participants" /></span>
					
						<span class="property-value" aria-labelledby="noOfParticipants-label"><g:fieldValue bean="${marupInstance}" field="noOfParticipants"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="marup.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${marupInstance?.person?.id}">${marupInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.preferredVenue}">
				<li class="fieldcontain">
					<span id="preferredVenue-label" class="property-label"><g:message code="marup.preferredVenue.label" default="Preferred Venue" /></span>
					
						<span class="property-value" aria-labelledby="preferredVenue-label"><g:fieldValue bean="${marupInstance}" field="preferredVenue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.slotSelections}">
				<li class="fieldcontain">
					<span id="slotSelections-label" class="property-label"><g:message code="marup.slotSelections.label" default="Slot Selections" /></span>
					
						<g:each in="${marupInstance.slotSelections}" var="s">
						<span class="property-value" aria-labelledby="slotSelections-label"><g:link controller="slotSelection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="marup.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${marupInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.subscriptions}">
				<li class="fieldcontain">
					<span id="subscriptions-label" class="property-label"><g:message code="marup.subscriptions.label" default="Subscriptions" /></span>
					
						<g:each in="${marupInstance.subscriptions}" var="s">
						<span class="property-value" aria-labelledby="subscriptions-label"><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${marupInstance?.sumAssured}">
				<li class="fieldcontain">
					<span id="sumAssured-label" class="property-label"><g:message code="marup.sumAssured.label" default="Sum Assured" /></span>
					
						<span class="property-value" aria-labelledby="sumAssured-label"><g:fieldValue bean="${marupInstance}" field="sumAssured"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:marupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${marupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
