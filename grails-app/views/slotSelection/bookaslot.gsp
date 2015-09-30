
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
					$("#spinner_" + id).css("display", "inline")
				},
				success : function(data) {
					console.log(data); //<-----this logs the data in browser's console
					$("#selection_status_"+id).text(data.selectionStatus)
					if(data.selectionStatus === "Empty"){						
						$("#link_"+id).text("Book this slot")
					}else{
						$("#link_"+id).text("Unbook")
					}
				},
				complete : function (){
					$("#spinner_" + id).css("display", "none")
				},
				error : function(xhr) {
					alert(xhr.responseText); //<----when no data alert the err msg
				}
			});
		}
	</script>
	<a href="#list-slotSelection" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-slotSelection" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-condensed" id="slot_selection_table">
			<thead>
				<tr>

					<g:sortableColumn property="slotName"
						title="${message(code: 'slotSelection.slotName.label', default: 'Slot')}"
						style="width: 100px;" />

					<g:sortableColumn property="selectionStatus"
						title="${message(code: 'slotSelection.selectionStatus.label', default: 'Status')}" />

					<g:sortableColumn property="dateBooked"
						title="${message(code: 'slotSelection.dateBooked.label', default: 'Date Booked')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${slotSelectionInstanceList}" status="i"
					var="slotSelectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${slotSelectionInstance.id}">
								${fieldValue(bean: slotSelectionInstance, field: "slotName")}
							</g:link></td>

						<td id="selection_status_${slotSelectionInstance.id}">
							${fieldValue(bean: slotSelectionInstance, field: "selectionStatus")}
						</td>

						<td><g:formatDate date="${slotSelectionInstance.dateBooked}" /></td>
						<td style="width: 116px; text-align: right;">
							<i id="spinner_${slotSelectionInstance.id}" class="fa fa-circle-o-notch fa-spin" style="display: none"></i>
							<a id="link_${slotSelectionInstance.id}" style="padding-left: 3px" onclick="bookSlot('${slotSelectionInstance.id}', '${slotSelectionInstance.marup.id}')">${slotSelectionInstance.selectionStatus == "Empty" ? "Book this slot" : "Unbook"}</a>
						</td>							
					</tr>
				</g:each>
			</tbody>
		</table>

	</div>
</body>

</html>
