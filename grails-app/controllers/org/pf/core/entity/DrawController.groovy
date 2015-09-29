package org.pf.core.entity



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DrawController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Draw.list(params), model:[drawInstanceCount: Draw.count()]
    }

    def show(Draw drawInstance) {
        respond drawInstance
    }

    def create() {
        respond new Draw(params)
    }

    @Transactional
    def save(Draw drawInstance) {
        if (drawInstance == null) {
            notFound()
            return
        }

        if (drawInstance.hasErrors()) {
            respond drawInstance.errors, view:'create'
            return
        }

        drawInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'draw.label', default: 'Draw'), drawInstance.id])
                redirect drawInstance
            }
            '*' { respond drawInstance, [status: CREATED] }
        }
    }

    def edit(Draw drawInstance) {
        respond drawInstance
    }

    @Transactional
    def update(Draw drawInstance) {
        if (drawInstance == null) {
            notFound()
            return
        }

        if (drawInstance.hasErrors()) {
            respond drawInstance.errors, view:'edit'
            return
        }

        drawInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Draw.label', default: 'Draw'), drawInstance.id])
                redirect drawInstance
            }
            '*'{ respond drawInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Draw drawInstance) {

        if (drawInstance == null) {
            notFound()
            return
        }

        drawInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Draw.label', default: 'Draw'), drawInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'draw.label', default: 'Draw'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
