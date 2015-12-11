package org.pf.core.entity



import static org.springframework.http.HttpStatus.*

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class MarupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Marup.list(params), model:[marupInstanceCount: Marup.count()]
    }
	
	def search() {
		params.max = Math.min(params.max ? params.int('max'): 10, 100)
		def marupInstanceList = Marup.createCriteria().list (params) {
				or{
					if ( params.sumAssured ) {
						eq("sumAssured", params.sumAssured)
					}
					if ( params.noOfParticipants ) {
						eq("noOfParticipants", Integer.valueOf(params.noOfParticipants))
					}
					if ( params.preferredVenue ) {
						eq("preferredVenue", params.preferredVenue)
					}
				}
			   }
		respond marupInstanceList, model:[marupInstanceCount: marupInstanceList.totalCount, sumAssured:params.sumAssured, preferredVenue:params.preferredVenue, noOfParticipants:params.noOfParticipants]
		//respond Marup.list(params), model:[marupInstanceCount: Marup.count()]
	}

    def show(Marup marupInstance) {
        respond marupInstance
    }

    def create() {
        respond new Marup(params)
    }

    @Transactional
    def save(Marup marupInstance) {
        if (marupInstance == null) {
            notFound()
            return
        }		
		
		marupInstance.lastUpdatedBy="Daia"
		marupInstance.createdBy = "Daia"
		marupInstance.owner = Person.get(1)//TODO Should be changed to log in user.
		marupInstance.validate()
		if (marupInstance.hasErrors()) {
            respond marupInstance.errors, view:'create'
            return
        }
		
		marupInstance.save flush:true
		
		if(marupInstance.noOfParticipants){
			//Generate slots
			1.upto(marupInstance.noOfParticipants, {
				SlotSelection slotSelection = new SlotSelection(slotName: "SLOT " + it, selectionStatus: 'Empty', createdBy: 'Daia', lastUpdatedBy: 'Daia')
				slotSelection.marup = marupInstance
				println "Saving " + slotSelection.slotName + "..."
				slotSelection.validate()
				if (slotSelection.hasErrors()) {
					println slotSelection.errors
					respond slotSelection.errors, view:'create'
					return
				}
				
				slotSelection.save flush:true
			})
		}

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'marup.label', default: 'Marup'), marupInstance.id])
                redirect action:"search"
            }
            '*' { respond marupInstance, [status: CREATED] }
        }
    }

    def edit(Marup marupInstance) {
        respond marupInstance
    }

    @Transactional
    def update(Marup marupInstance) {
        if (marupInstance == null) {
            notFound()
            return
        }

        if (marupInstance.hasErrors()) {
            respond marupInstance.errors, view:'edit'
            return
        }

        marupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Marup.label', default: 'Marup'), marupInstance.id])
                redirect marupInstance
            }
            '*'{ respond marupInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Marup marupInstance) {

        if (marupInstance == null) {
            notFound()
            return
        }

        marupInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Marup.label', default: 'Marup'), marupInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'marup.label', default: 'Marup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
