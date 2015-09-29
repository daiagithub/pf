<%@ page import="org.pf.core.entity.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountStatus', 'error')} ">
	<label for="accountStatus">
		<g:message code="user.accountStatus.label" default="Account Status" />
		
	</label>
	<g:textField name="accountStatus" value="${userInstance?.accountStatus}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountType', 'error')} ">
	<label for="accountType">
		<g:message code="user.accountType.label" default="Account Type" />
		
	</label>
	<g:textField name="accountType" value="${userInstance?.accountType}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="user.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${userInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="user.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${userInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="user.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${userInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="user.person.label" default="Person" />
		
	</label>
	<g:select id="person" name="person.id" from="${org.pf.core.entity.Person.list()}" optionKey="id" required="" value="${userInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${userInstance?.userName}" />

</div>

