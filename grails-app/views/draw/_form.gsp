<%@ page import="org.pf.core.entity.Draw" %>



<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="draw.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${drawInstance?.createdBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'dateDrawn', 'error')} ">
	<label for="dateDrawn">
		<g:message code="draw.dateDrawn.label" default="Date Drawn" />
		
	</label>
	<g:datePicker name="dateDrawn" precision="day" value="${drawInstance?.dateDrawn}" />

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="draw.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${drawInstance?.description}" />

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'drawStatus', 'error')} ">
	<label for="drawStatus">
		<g:message code="draw.drawStatus.label" default="Draw Status" />
		
	</label>
	<g:textField name="drawStatus" value="${drawInstance?.drawStatus}" />

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="draw.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${drawInstance?.lastUpdatedBy}" />

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'marup', 'error')} ">
	<label for="marup">
		<g:message code="draw.marup.label" default="Marup" />
		
	</label>
	<g:select id="marup" name="marup.id" from="${org.pf.core.entity.Marup.list()}" optionKey="id" required="" value="${drawInstance?.marup?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'subscription', 'error')} ">
	<label for="subscription">
		<g:message code="draw.subscription.label" default="Subscription" />
		
	</label>
	<g:select id="subscription" name="subscription.id" from="${org.pf.core.entity.Subscription.list()}" optionKey="id" required="" value="${drawInstance?.subscription?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: drawInstance, field: 'totalAmount', 'error')} ">
	<label for="totalAmount">
		<g:message code="draw.totalAmount.label" default="Total Amount" />
		
	</label>
	<g:field type="number" name="totalAmount" value="${drawInstance.totalAmount}" />

</div>

