<%@ page import="org.pf.core.entity.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="comment.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${commentInstance?.comment}" />

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'commentedOn', 'error')} ">
	<label for="commentedOn">
		<g:message code="comment.commentedOn.label" default="Commented On" />
		
	</label>
	<g:datePicker name="commentedOn" precision="day" value="${commentInstance?.commentedOn}" />

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="comment.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${commentInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="comment.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${commentInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="comment.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${commentInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'marup', 'error')} ">
	<label for="marup">
		<g:message code="comment.marup.label" default="Marup" />
		
	</label>
	<g:select id="marup" name="marup.id" from="${org.pf.core.entity.Marup.list()}" optionKey="id" required="" value="${commentInstance?.marup?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="comment.person.label" default="Person" />
		
	</label>
	<g:select id="person" name="person.id" from="${org.pf.core.entity.Person.list()}" optionKey="id" required="" value="${commentInstance?.person?.id}" class="many-to-one"/>

</div>

