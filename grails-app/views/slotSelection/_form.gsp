<%@ page import="org.pf.core.entity.SlotSelection" %>



<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="slotSelection.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${slotSelectionInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'dateBooked', 'error')} ">
	<label for="dateBooked">
		<g:message code="slotSelection.dateBooked.label" default="Date Booked" />
		
	</label>
	<g:datePicker name="dateBooked" precision="day" value="${slotSelectionInstance?.dateBooked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="slotSelection.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${slotSelectionInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="slotSelection.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${slotSelectionInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'marup', 'error')} ">
	<label for="marup">
		<g:message code="slotSelection.marup.label" default="Marup" />
		
	</label>
	<g:select id="marup" name="marup.id" from="${org.pf.core.entity.Marup.list()}" optionKey="id" required="" value="${slotSelectionInstance?.marup?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="slotSelection.person.label" default="Person" />
		
	</label>
	<g:select id="person" name="person.id" from="${org.pf.core.entity.Person.list()}" optionKey="id" required="" value="${slotSelectionInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'selectionStatus', 'error')} ">
	<label for="selectionStatus">
		<g:message code="slotSelection.selectionStatus.label" default="Selection Status" />
		
	</label>
	<g:textField name="selectionStatus" value="${slotSelectionInstance?.selectionStatus}" />

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'slotName', 'error')} ">
	<label for="slotName">
		<g:message code="slotSelection.slotName.label" default="Slot Name" />
		
	</label>
	<g:textField name="slotName" value="${slotSelectionInstance?.slotName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: slotSelectionInstance, field: 'subscriptions', 'error')} ">
	<label for="subscriptions">
		<g:message code="slotSelection.subscriptions.label" default="Subscriptions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${slotSelectionInstance?.subscriptions?}" var="s">
    <li><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subscription" action="create" params="['slotSelection.id': slotSelectionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscription.label', default: 'Subscription')])}</g:link>
</li>
</ul>


</div>

