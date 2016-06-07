<div class="row">
	        <div class="col-xs-4 col-sm-8">
	            <h2>
					<g:message code="recent.list.label" args="[entityName]" default="Marups" />
				</h2>
	        </div>

	                     
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
		<div class="row">
	        <div class="col-xs-4 col-sm-8">
	            <h2>
					<g:message code="recent.list.label" args="[entityName]" default="Recent Marups" />
				</h2>
	        </div>

	        <div class="col-xs-4 col-sm-4" style="text-align: right; margin-top: 22px;">
	            <g:link action="create" controller="marup" >Click here to create new Marup</g:link>
	        </div>              
	    </div>

		
		
		<table class="table table-condensed">
			<thead>
				<tr>
			
					<td>Details</td>
					<td style="text-align: right;">Initial Sum Assured</td>
					<td style="text-align: right;">Booking status</td>	
					<td >Created on</td>


				</tr>
			</thead>
			
			<tbody>
				<g:each in="${marupInstanceList}" status="i" var="marupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:link controller="marup" action="show" id="${marupInstance.id}">
								${marupInstance.installment ? "Rs " + marupInstance.installment : ""} 
								${marupInstance.drawCycle?:""} 
								${marupInstance.noOfParticipants? " x " + marupInstance.noOfParticipants :""}
								${marupInstance.interest? " @" + marupInstance.interest :""}
								- By ${marupInstance?.owner?.firstName}${marupInstance?.owner?.lastName ? " " + marupInstance?.owner?.lastName : ""}${marupInstance?.preferredVenue ? ", " + marupInstance?.preferredVenue : ""}
							</g:link>
						</td>
												
						<td style="text-align: right;">
							${marupInstance.sumAssured ? "Rs " + marupInstance.sumAssured : ""}
						</td>
						
						<td style="text-align: right;">
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