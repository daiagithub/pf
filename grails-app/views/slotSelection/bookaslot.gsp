
<%@ page import="org.pf.core.entity.SlotSelection"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'slotSelection.label', default: 'SlotSelection')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<script>
	
	
		function bookSlot(id, marup_id){
			$.ajax({
				url : "/pf/slotSelection/selectslot",
				type : "post",
				dataType : 'json',
				data:{marup_id:marup_id, id:id, command: $("#link_"+id).text()},
				beforeSend: function() {
					//$("#spinner_" + id).css("display", "inline")
				},
				success : function(data) {
					console.log(data); //<-----this logs the data in browser's console
					/*
					$("#selection_status_"+id).text(data.selectionStatus)
					
					if(data.selectionStatus === "Empty"){						
						$("#link_"+id).text("Book this slot")
						$("#hold_label_"+id).attr("disabled", "disabled")
						$("#confirm_label_"+id).attr("disabled", "disabled")
						
					}else{
						
						$("#link_"+id).text("Unbook")
						$("#hold_label_"+id).removeAttr("disabled")
						$("#confirm_label_"+id).removeAttr("disabled")
					}
					*/

					window.location = "/pf/slotSelection/bookaslot/"+marup_id;
				},
				complete : function (){
					//$("#spinner_" + id).css("display", "none")
				},
				error : function(xhr) {
					alert(xhr.responseText); //<----when no data alert the err msg
				}
			});
		}

		function confirmOrHoldSlot(marupid, id, decision){
			$.post( "/pf/slotSelection/confirmSlot", { id: id, decision: decision } ).done(function( data ) {
    			window.location = "/pf/slotSelection/bookaslot/"+marupid;
  			});
		}		
	</script>
	
	<div id="list-slotSelection" class="content scaffold-list" role="main">
		<h2>
			<g:message code="show.label" args="[entityName]" default="Book slot for marup #${marup.id} (${marup.installment ? "Rs " + marup.installment : ""}
								${marup.drawCycle?:""} 
								${marup.noOfParticipants? " x " + marup.noOfParticipants :""}
								${marup.interest? " @" + marup.interest :""}
								- By ${marup?.owner?.firstName}${marup?.owner?.lastName ? " " + marup?.owner?.lastName : ""}${marup?.preferredVenue ? ", " + marup?.preferredVenue : ""})" />

		</h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<dl class="dl-horizontal">
		  <dt>Installment</dt>
		  <dd>${marup.installment}</dd>

		  <dt>No of participants</dt>
		  <dd>${marup.noOfParticipants}</dd>

		  <dt>Interest</dt>
		  <dd>${marup.interest}</dd>

		  <dt>Sum assured</dt>
		  <dd>${marup.sumAssured}</dd>

		  <dt>Contribution for Mohori</dt>
		  <dd>${marup.installment}</dd>

		  <dt>Draw Type</dt>
		  <dd>${marup.drawType}</dd>

		  <dt>Draw Cycle</dt>
		  <dd>${marup.drawCycle}</dd>

		  <dt>Start Date</dt>
		  <dd>${marup.startDate}</dd>

		  <dt>Preferred Vanue</dt>
		  <dd>${marup.preferredVanue}</dd>

		  <dt>Owner</dt>
		  <dd>${marup.owner.firstName}</dd>

		  <dt>Description</dt>
		  <dd>${marup.description}</dd>
		</dl>
		<table class="table table-condensed" id="slot_selection_table">
			<thead>
				<tr>	

				</tr>
			</thead>
			<tbody>

				<g:each in="${slotSelectionInstanceList}" status="i"
					var="slotSelectionInstance">

					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" style="line-height:1.328571">

						<td style=" line-height:1.328571; "><g:link action="show" style="display: inline-block; margin-top: 8px; font-size: 12px" id="${slotSelectionInstance.id}">
								${fieldValue(bean: slotSelectionInstance, field: "slotName")} 
							</g:link>
							<div style="font-size: 12px; display: inline-block; float: right;  ">
								<div id="selection_status_${slotSelectionInstance.id}" style="font-weight: bold; display: block; text-align: right; color: #333">
									${fieldValue(bean: slotSelectionInstance, field: "selectionStatus")}
								</div>
								<div id="booked_by_${slotSelectionInstance.id}" style="display: block; text-align: right; color: #9d9d9d">
									${slotSelectionInstance.person ? slotSelectionInstance.person?.firstName : '--'}
								</div>
							</div>
						</td>
						
						<td style="text-align:right; width: 100px; line-height:1.328571; font-size: 12px; vertical-align: middle">
							<i id="spinner_${slotSelectionInstance.id}" class="fa fa-circle-o-notch fa-spin" style="display: none"></i>

							<g:if test="${slotSelectionInstance.selectionStatus == 'Confirmed' || slotSelectionInstance.selectionStatus == 'On hold'}">
								<g:if test="${slotSelectionInstance.marup?.owner?.users != null && slotSelectionInstance.marup?.owner?.users[0]?.username == sec.username().trim()}">
									<a id="link_${slotSelectionInstance.id}" style="padding-left: 3px; cursor: pointer" onclick="bookSlot('${slotSelectionInstance.id}', '${slotSelectionInstance.marup.id}')"  >${slotSelectionInstance.selectionStatus == "Empty" ? "Book this slot" : "Unbook"}</a>
								</g:if>								
							</g:if>

							<g:else>
								<a id="link_${slotSelectionInstance.id}" style="padding-left: 3px; cursor: pointer" onclick="bookSlot('${slotSelectionInstance.id}', '${slotSelectionInstance.marup.id}')"  >${slotSelectionInstance.selectionStatus == "Empty" ? "Book this slot" : "Unbook"}</a>
							</g:else>
							
						</td>

						<g:if test="${slotSelectionInstance.marup?.owner?.users != null && (slotSelectionInstance.marup?.owner?.users[0]?.username == sec.username().trim())}">
						    <td style="text-align: right; width: 180px; line-height:1.328571">	
						    	<div class="btn-group" data-toggle="buttons">						    		
							  		<label id="confirm_label_${slotSelectionInstance.id}" class="btn btn-primary btn-sm" ${slotSelectionInstance.selectionStatus == 'Empty' || slotSelectionInstance.selectionStatus == 'Confirmed' ? "disabled" : ""} onclick="confirmOrHoldSlot(${slotSelectionInstance.marup.id}, ${slotSelectionInstance.id}, 'confirm')" style="width:82px">
							    		<input type="radio" name="options" id="confirm_${slotSelectionInstance.id}" autocomplete="off" > ${slotSelectionInstance.selectionStatus != 'Confirmed' ? 'Confirm' : slotSelectionInstance.selectionStatus}
							  		</label>
							  		<label id="hold_label_${slotSelectionInstance.id}" class="btn btn-primary btn-sm" onclick="confirmOrHoldSlot(${slotSelectionInstance.marup.id}, ${slotSelectionInstance.id}, 'hold')" ${slotSelectionInstance.selectionStatus == 'Empty' || slotSelectionInstance.selectionStatus == 'On hold'? "disabled=disabled" : ""} style="width:66px">
							    		<input type="radio" name="options" id="hold_${slotSelectionInstance.id}" autocomplete="off" > ${slotSelectionInstance.selectionStatus != 'On hold' ? 'Hold' : slotSelectionInstance.selectionStatus}
							  		</label>								  
								</div>													
							</td>
						</g:if>
													
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>
