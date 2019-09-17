accessing
totalCost

	totalCost isNil ifTrue: 
		[totalCost := 
			(self averageCostOfWorkshops * self nbOfWorkshops) +
		   (self averageCostOfMeetings * self nbOfMeetings) +
			(self averageCostOfCouncilMeetings * self nbOfCouncilMeetings) +
			(self averageCostOfForums * self nbOfForums) +
			(self averageCostOfSurveys * self nbOfSurveys) +
			(self averageCostOfStudies * self nbOfStudies) +
			 self contractCost ].
	^ totalCost