package org.pf.core.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SlotSelectionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SlotSelection.list(params), model:[slotSelectionInstanceCount: SlotSelection.count()]
    }
	
	def bookaslot(Integer max) {
		println params
		def marup = Marup.get(params.id)
		println marup.id
		def slotSelectionInstanceList = SlotSelection.findAllByMarup(marup)
		respond slotSelectionInstanceList
	}
	
	@Transactional
	def selectslot(Integer max) {
		println params 
		def slotSelection = SlotSelection.get(params.id)
		if(params.command?.equals("Book this slot")){
			slotSelection.selectionStatus = "Under Review"
		}else{
			slotSelection.selectionStatus = "Empty"
		}
		
		slotSelection.save flush:true
		render status:200, text:slotSelection as JSON  
	}

    def show(SlotSelection slotSelectionInstance) {
        respond slotSelectionInstance
    }

    def create() {
        respond new SlotSelection(params)
    }

    @Transactional
    def save(SlotSelection slotSelectionInstance) {
        if (slotSelectionInstance == null) {
            notFound()
            return
        }

        if (slotSelectionInstance.hasErrors()) {
            respond slotSelectionInstance.errors, view:'create'
            return
        }

        slotSelectionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'slotSelection.label', default: 'SlotSelection'), slotSelectionInstance.id])
                redirect slotSelectionInstance
            }
            '*' { respond slotSelectionInstance, [status: CREATED] }
        }
    }

    def edit(SlotSelection slotSelectionInstance) {
        respond slotSelectionInstance
    }

    @Transactional
    def update(SlotSelection slotSelectionInstance) {
        if (slotSelectionInstance == null) {
            notFound()
            return
        }

        if (slotSelectionInstance.hasErrors()) {
            respond slotSelectionInstance.errors, view:'edit'
            return
        }

        slotSelectionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SlotSelection.label', default: 'SlotSelection'), slotSelectionInstance.id])
                redirect slotSelectionInstance
            }
            '*'{ respond slotSelectionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SlotSelection slotSelectionInstance) {

        if (slotSelectionInstance == null) {
            notFound()
            return
        }

        slotSelectionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SlotSelection.label', default: 'SlotSelection'), slotSelectionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'slotSelection.label', default: 'SlotSelection'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
