package org.pf.core.entity

import org.grails.databinding.BindingFormat;

class Marup {

	BigDecimal installment				//Installment amount for a draw
	Float interest			
	Integer noOfParticipants
	BigDecimal sumAssured
	@BindingFormat ("dd/MM/yyyy")
	Date startDate
	String drawDate
	Integer contributionForMohori		//Percentage of contribution for Mohori
	String drawType
	String drawCycle
	String preferredVenue	
	String description
	
	Date dateCreated
	Date lastUpdated
	String createdBy
	String lastUpdatedBy
	
	static belongsTo = [owner:Person]
	static hasMany =[slotSelections:SlotSelection, draws:Draw, subscriptions:Subscription]
	
    static constraints = {
		installment nullable:true
		interest nullable:true
		noOfParticipants nullable:true
		sumAssured nullable:true
		startDate nullable:true
		drawDate nullable:true
		contributionForMohori nullable:true
		drawType inList: ["Lucky Draw", "Sequence"], nullable: true
		drawCycle inList: ["Weekly", "Monthly", "Quarterly", "Half-Yearly", "Anually"], nullable: true
		preferredVenue nullable:true
		description nullable:true
    }
}
