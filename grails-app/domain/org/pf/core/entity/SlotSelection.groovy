package org.pf.core.entity

import java.util.Date;

class SlotSelection {

	transient bookedBy

	String slotName	
	Date dateBooked
	String selectionStatus		//Once Confirmed, use will have a subscription
	
	String description
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy

	static belongsTo = [person:Person, marup:Marup]
	static hasMany =[subscriptions:Subscription]

	static transients = ['bookedBy']
	
    static constraints = {
    	selectionStatus inList: ['Empty', 'Under review', 'Confirmed', 'On hold', 'Denied']
		dateBooked nullable:true
		person nullable:true
		description nullable:true
	}
}
