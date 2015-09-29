package org.pf.core.entity

import java.util.Date;

class Draw {
	
	Date dateDrawn
	BigDecimal totalAmount
	String drawStatus
	
	String description
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy
	
	static belongsTo = [subscription:Subscription, marup:Marup]
	
    static constraints = {
    	drawStatus inList: ["Awaiting...", "Its on", "Winner Declared", "Disbursed", "Rescheduled", "Cancelled"]
	}
}
