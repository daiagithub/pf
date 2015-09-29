package org.pf.core.entity



import grails.test.mixin.*
import spock.lang.*

@TestFor(MarupController)
@Mock(Marup)
class MarupControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.marupInstanceList
            model.marupInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.marupInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def marup = new Marup()
            marup.validate()
            controller.save(marup)

        then:"The create view is rendered again with the correct model"
            model.marupInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            marup = new Marup(params)

            controller.save(marup)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/marup/show/1'
            controller.flash.message != null
            Marup.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def marup = new Marup(params)
            controller.show(marup)

        then:"A model is populated containing the domain instance"
            model.marupInstance == marup
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def marup = new Marup(params)
            controller.edit(marup)

        then:"A model is populated containing the domain instance"
            model.marupInstance == marup
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/marup/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def marup = new Marup()
            marup.validate()
            controller.update(marup)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.marupInstance == marup

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            marup = new Marup(params).save(flush: true)
            controller.update(marup)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/marup/show/$marup.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/marup/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def marup = new Marup(params).save(flush: true)

        then:"It exists"
            Marup.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(marup)

        then:"The instance is deleted"
            Marup.count() == 0
            response.redirectedUrl == '/marup/index'
            flash.message != null
    }
}
