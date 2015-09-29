<%@ page import="org.pf.core.entity.Subscription" %>



<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="subscription.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${subscriptionInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'dateSubscribed', 'error')} ">
	<label for="dateSubscribed">
		<g:message code="subscription.dateSubscribed.label" default="Date Subscribed" />
		
	</label>
	<g:datePicker name="dateSubscribed" precision="day" value="${subscriptionInstance?.dateSubscribed}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="subscription.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${subscriptionInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'draws', 'error')} ">
	<label for="draws">
		<g:message code="subscription.draws.label" default="Draws" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${subscriptionInstance?.draws?}" var="d">
    <li><g:link controller="draw" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="draw" action="create" params="['subscription.id': subscriptionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'draw.label', default: 'Draw')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="subscription.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${subscriptionInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'marup', 'error')} ">
	<label for="marup">
		<g:message code="subscription.marup.label" default="Marup" />
		
	</label>
	<g:select id="marup" name="marup.id" from="${org.pf.core.entity.Marup.list()}" optionKey="id" required="" value="${subscriptionInstance?.marup?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="subscription.person.label" default="Person" />
		
	</label>
	<g:select id="person" name="person.id" from="${org.pf.core.entity.Person.list()}" optionKey="id" required="" value="${subscriptionInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'slotSelection', 'error')} ">
	<label for="slotSelection">
		<g:message code="subscription.slotSelection.label" default="Slot Selection" />
		
	</label>
	<g:select id="slotSelection" name="slotSelection.id" from="${org.pf.core.entity.SlotSelection.list()}" optionKey="id" required="" value="${subscriptionInstance?.slotSelection?.id}" class="many-to-one"/>

</div>

