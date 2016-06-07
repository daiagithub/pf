package org.pf.core.entity

import org.pf.core.secure.User;

class Person {

	String firstName
	String lastName

	String addressLine1
	String addressLine2
	String area
	String city
	String pinCode
	String state
	String country

	String description
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy

	static hasMany =[users: User, slotSelections:SlotSelection, marups:Marup, subscriptions:Subscription]

	static constraints = {
		lastName nullable:true
		addressLine1 nullable:true
		addressLine2 nullable:true
		area nullable:true
		city nullable:true
		pinCode nullable:true
		state nullable:true
		country nullable:true
		description nullable:true
	}
}
