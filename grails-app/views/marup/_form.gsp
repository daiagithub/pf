<%@ page import="org.pf.core.entity.Marup"%>

<div class="row">
	<div class="col-xs-6 col-sm-4">
		<div class="form-group ${hasErrors(bean: marupInstance, field: 'installment', 'has-error')} ">
			<label for="installment"> <g:message
					code="marup.installment.label" default="Installment" />
			</label>
			<g:field class="form-control" type="number" name="installment"
				value="${marupInstance.installment}" />
		</div>
	</div>
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'noOfParticipants', 'has-error')} ">
			<label for="noOfParticipants"> <g:message
					code="marup.noOfParticipants.label" default="No Of Participants" /></label>
			<g:field type="number" class="form-control" name="noOfParticipants"
				value="${marupInstance.noOfParticipants}" />
		</div>
	</div>
	<!-- Optional: clear the XS cols if their content doesn't match in height -->
	<div class="clearfix visible-xs-block"></div>
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'interest', 'has-error')} ">
			<label class="control-label" for="interest"> <g:message code="marup.interest.label"
					default="Interest" />
			</label>
			<g:field type="number" class="form-control" name="interest"
				value="${marupInstance.interest}" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'sumAssured', 'has-error')} ">
			<label for="sumAssured"> <g:message
					code="marup.sumAssured.label" default="Sum Assured" />

			</label>
			<g:field type="number" class="form-control" name="sumAssured"
				value="${marupInstance.sumAssured}" />

		</div>
	</div>
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'contributionForMohori', 'has-error')} ">
			<label for="contributionForMohori"> <g:message
					code="marup.contributionForMohori.label"
					default="Contribution For Mohori" />

			</label>
			<g:field type="number" class="form-control"
				name="contributionForMohori"
				value="${marupInstance.contributionForMohori}" />

		</div>
	</div>
	<!-- Optional: clear the XS cols if their content doesn't match in height -->
	<div class="clearfix visible-xs-block"></div>
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'drawType', 'has-error')} ">
			<label for="drawType"> <g:message code="marup.drawType.label"
					default="Draw Type" />

			</label>
			<g:select name="drawType"
				from="${marupInstance.constraints.drawType.inList}"
				class="form-control" value="${marupInstance?.drawType}" />


		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'drawCycle', 'has-error')} ">
			<label for="drawCycle"> <g:message
					code="marup.drawCycle.label" default="Draw Cycle" />

			</label>

			<g:select name="drawCycle"
				from="${marupInstance.constraints.drawCycle.inList}"
				class="form-control" value="${marupInstance?.drawCycle}" />

		</div>
	</div>
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'startDate', 'has-error')} ">
			<label for="startDate"> <g:message code="marup.startDate.label"
					default="Start Date" />

			</label>
			
			<g:textField name="startDate" class="form-control datepicker"
				value="${marupInstance?.startDate}" />

		</div>
	</div>
	<!-- Optional: clear the XS cols if their content doesn't match in height -->
	<div class="clearfix visible-xs-block"></div>
	<div class="col-xs-6 col-sm-4">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'preferredVenue', 'has-error')} ">
			<label for="preferredVenue"> <g:message
					code="marup.description.label" default="Preferred Venue" />

			</label>
			<g:textField name="preferredVenue" class="form-control"
				value="${marupInstance?.preferredVenue}" />

		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div
			class="form-group ${hasErrors(bean: marupInstance, field: 'description', 'has-error')} ">
			<label for="description"> <g:message
					code="marup.description.label" default="Description" />

			</label>
			<g:textArea class="form-control" style="height: 176px"
				name="description" value="${marupInstance?.description}"></g:textArea>
		</div>

	</div>

</div>

