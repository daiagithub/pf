<%@ page import="org.pf.core.entity.Marup" %>



<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'contributionForMohori', 'error')} ">
	<label for="contributionForMohori">
		<g:message code="marup.contributionForMohori.label" default="Contribution For Mohori" />
		
	</label>
	<g:field type="number" name="contributionForMohori" value="${marupInstance.contributionForMohori}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="marup.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${marupInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="marup.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${marupInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'drawCycle', 'error')} ">
	<label for="drawCycle">
		<g:message code="marup.drawCycle.label" default="Draw Cycle" />
		
	</label>
	<g:textField name="drawCycle" value="${marupInstance?.drawCycle}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'drawDate', 'error')} ">
	<label for="drawDate">
		<g:message code="marup.drawDate.label" default="Draw Date" />
		
	</label>
	<g:textField name="drawDate" value="${marupInstance?.drawDate}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'drawType', 'error')} ">
	<label for="drawType">
		<g:message code="marup.drawType.label" default="Draw Type" />
		
	</label>
	<g:textField name="drawType" value="${marupInstance?.drawType}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'draws', 'error')} ">
	<label for="draws">
		<g:message code="marup.draws.label" default="Draws" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${marupInstance?.draws?}" var="d">
    <li><g:link controller="draw" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="draw" action="create" params="['marup.id': marupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'draw.label', default: 'Draw')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'installment', 'error')} ">
	<label for="installment">
		<g:message code="marup.installment.label" default="Installment" />
		
	</label>
	<g:field type="number" name="installment" value="${marupInstance.installment}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'interest', 'error')} ">
	<label for="interest">
		<g:message code="marup.interest.label" default="Interest" />
		
	</label>
	<g:field type="number" name="interest" value="${marupInstance.interest}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="marup.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${marupInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'noOfParticipants', 'error')} ">
	<label for="noOfParticipants">
		<g:message code="marup.noOfParticipants.label" default="No Of Participants" />
		
	</label>
	<g:field type="number" name="noOfParticipants" value="${marupInstance.noOfParticipants}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="marup.person.label" default="Person" />
		
	</label>
	<g:select id="person" name="person.id" from="${org.pf.core.entity.Person.list()}" optionKey="id" required="" value="${marupInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'preferredVenue', 'error')} ">
	<label for="preferredVenue">
		<g:message code="marup.preferredVenue.label" default="Preferred Venue" />
		
	</label>
	<g:textField name="preferredVenue" value="${marupInstance?.preferredVenue}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'slotSelections', 'error')} ">
	<label for="slotSelections">
		<g:message code="marup.slotSelections.label" default="Slot Selections" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${marupInstance?.slotSelections?}" var="s">
    <li><g:link controller="slotSelection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="slotSelection" action="create" params="['marup.id': marupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'slotSelection.label', default: 'SlotSelection')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'startDate', 'error')} ">
	<label for="startDate">
		<g:message code="marup.startDate.label" default="Start Date" />
		
	</label>
	<g:datePicker name="startDate" precision="day" value="${marupInstance?.startDate}" />

</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'subscriptions', 'error')} ">
	<label for="subscriptions">
		<g:message code="marup.subscriptions.label" default="Subscriptions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${marupInstance?.subscriptions?}" var="s">
    <li><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subscription" action="create" params="['marup.id': marupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscription.label', default: 'Subscription')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: marupInstance, field: 'sumAssured', 'error')} ">
	<label for="sumAssured">
		<g:message code="marup.sumAssured.label" default="Sum Assured" />
		
	</label>
	<g:field type="number" name="sumAssured" value="${marupInstance.sumAssured}" />

</div>

