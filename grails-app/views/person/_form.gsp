<%@ page import="org.pf.core.entity.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'addressLine1', 'error')} ">
	<label for="addressLine1">
		<g:message code="person.addressLine1.label" default="Address Line1" />
		
	</label>
	<g:textField name="addressLine1" value="${personInstance?.addressLine1}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'addressLine2', 'error')} ">
	<label for="addressLine2">
		<g:message code="person.addressLine2.label" default="Address Line2" />
		
	</label>
	<g:textField name="addressLine2" value="${personInstance?.addressLine2}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="person.area.label" default="Area" />
		
	</label>
	<g:textField name="area" value="${personInstance?.area}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="person.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${personInstance?.city}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="person.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${personInstance?.country}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="person.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${personInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="person.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${personInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${personInstance?.firstName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${personInstance?.lastName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="person.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${personInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'marups', 'error')} ">
	<label for="marups">
		<g:message code="person.marups.label" default="Marups" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.marups?}" var="m">
    <li><g:link controller="marup" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="marup" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'marup.label', default: 'Marup')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'pinCode', 'error')} ">
	<label for="pinCode">
		<g:message code="person.pinCode.label" default="Pin Code" />
		
	</label>
	<g:textField name="pinCode" value="${personInstance?.pinCode}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'slotSelections', 'error')} ">
	<label for="slotSelections">
		<g:message code="person.slotSelections.label" default="Slot Selections" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.slotSelections?}" var="s">
    <li><g:link controller="slotSelection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="slotSelection" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'slotSelection.label', default: 'SlotSelection')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="person.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${personInstance?.state}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'subscriptions', 'error')} ">
	<label for="subscriptions">
		<g:message code="person.subscriptions.label" default="Subscriptions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.subscriptions?}" var="s">
    <li><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subscription" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscription.label', default: 'Subscription')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="person.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>


</div>

