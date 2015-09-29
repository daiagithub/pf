package org.pf.core.entity

import java.util.Date;

class Subscription {

	Date dateSubscribed
	
	String description
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy
	
	static belongsTo = [person:Person, marup:Marup, slotSelection:SlotSelection]
	static hasMany =[draws:Draw]
	
    static constraints = {
    }
}
