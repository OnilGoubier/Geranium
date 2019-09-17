visiting
visitAwarenessConcertationCostProfile: anAwarenessConcertationCostProfile

	| awCampaigns rsize nbTimes averageCostOfWorkshops averageCostOfMeetings averageCostOfCouncilMeetings averageCostOfForums averageCostOfSurveys averageCostOfStudies nbOfWorkshops nbOfMeetings nbOfCouncilMeetings nbOfForums nbOfSurveys nbOfStudies nbOfParticipants contractCost totalCost|
	
	nbTimes := anAwarenessConcertationCostProfile nbOfTimes.
	averageCostOfWorkshops := anAwarenessConcertationCostProfile averageCostOfWorkshops.
	averageCostOfMeetings := anAwarenessConcertationCostProfile averageCostOfMeetings.
	averageCostOfCouncilMeetings := anAwarenessConcertationCostProfile averageCostOfCouncilMeetings.
	averageCostOfForums := anAwarenessConcertationCostProfile averageCostOfForums.
	averageCostOfSurveys := anAwarenessConcertationCostProfile averageCostOfSurveys.
	averageCostOfStudies := anAwarenessConcertationCostProfile averageCostOfStudies.
	nbOfWorkshops := anAwarenessConcertationCostProfile nbOfWorkshops.
	nbOfMeetings := anAwarenessConcertationCostProfile nbOfMeetings.
	nbOfCouncilMeetings := anAwarenessConcertationCostProfile nbOfCouncilMeetings.
	nbOfForums := anAwarenessConcertationCostProfile nbOfForums.
	nbOfSurveys := anAwarenessConcertationCostProfile nbOfSurveys.
	nbOfStudies := anAwarenessConcertationCostProfile nbOfStudies.
	nbOfParticipants := anAwarenessConcertationCostProfile nbOfParticipants.
	contractCost := anAwarenessConcertationCostProfile contractCost.
	(nbTimes <= 0) 
		ifTrue: [ rsize := 0 ] ifFalse: [ rsize := nbTimes ].
	awCampaigns := Array new: rsize.
	1 to: nbTimes do: [  :i || a |
			a := AwarenessConcertation new.
			a nbOfTimes: nbTimes.
			a residences: OrderedCollection new.
				"(self residences select: [:r | r occupants awareness = ConsumptionUnaware ])".
			a success: (anAwarenessConcertationCostProfile successProbabilities: 1).
			a qNumber: i.
			a convertedResidences: OrderedCollection new.
			a averageCostOfWorkshops: averageCostOfWorkshops next.
			a averageCostOfMeetings: averageCostOfMeetings next.
			a averageCostOfCouncilMeetings: averageCostOfCouncilMeetings next.
			a averageCostOfForums: averageCostOfForums next.
			a averageCostOfSurveys: averageCostOfSurveys next.
			a averageCostOfStudies: averageCostOfStudies next. 
			a nbOfWorkshops: nbOfWorkshops next.
			a nbOfMeetings: nbOfMeetings next.
			a nbOfCouncilMeetings: nbOfCouncilMeetings next.
			a nbOfForums: nbOfForums next.
			a nbOfSurveys: nbOfSurveys next.
			a nbOfStudies: nbOfStudies next.
			a nbOfParticipants: nbOfParticipants next.
			a contractCost: contractCost next.
			a totalCost.
			awCampaigns at: i put: a].
	^ awCampaigns
	