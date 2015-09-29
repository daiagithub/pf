package org.pf.core.entity

import java.util.Date;

class Comment {

	String comment
	Date commentedOn
	
	String description
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy
	
	static belongsTo = [person:Person, marup:Marup] 
	
    static constraints = {
    }
}
