package org.pf.core.entity

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index() {
        params.max = Math.min(params.max ? params.int('max'): 10, 100)
        def marupInstanceList = Marup.createCriteria().list (params) {
                order("dateCreated", "desc")
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

        def userCreatedMarupInstanceList = Marup.createCriteria().list() {
            order("dateCreated", "desc")
            eq("owner", springSecurityService.currentUser?.person)            
        }

        /*def userInteractedMarupInstanceList = Marup.createCriteria().list() {
            order("dateCreated", "desc")
            slotSelections{
                eq("person", springSecurityService.currentUser?.person)
            }
        }*/

        //def userInteractedMarupInstanceList = Marup.collection.find("slotSelection.persons": springSecurityService.currentUser?.person)

        //TODO The below code should be optimized
        def slotSelections = SlotSelection.findAll{person == springSecurityService.currentUser?.person}
        //println slotSelections
        def userInteractedMarupInstanceList = []
        userInteractedMarupInstanceList = slotSelections.collect{ it.marup }

    println userInteractedMarupInstanceList

        respond marupInstanceList, model:[marupInstanceCount: marupInstanceList.totalCount, sumAssured:params.sumAssured, preferredVenue:params.preferredVenue, noOfParticipants:params.noOfParticipants, userCreatedMarupInstanceList: userCreatedMarupInstanceList, userInteractedMarupInstanceList: userInteractedMarupInstanceList]
    }   
}
