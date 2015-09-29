package org.pf.core.entity

import java.util.Date;

class User {
	
	String userName
	String password
	String accountType
	String accountStatus
	
	String description
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy

	static belongsTo = [person:Person]
		
    static constraints = {
    	accountStatus inList: ['Active', 'Inactive']
		accountType inList: ['Administrator', 'Subscriber']
	}
}
