computing
convertResidencesForCampaignNbOfTimeSaved: aNumber

	|p convResidences|
	(aNumber <= 0) ifTrue: [ ^self ].
	1 to: aNumber do:
		[:i | p := self successProbabilityFor: i.
		self success probabilities: { p . 1-p }.

		convResidences := OrderedCollection new.
		convResidences := (self residences at: i) select: [ :r |self success next = Successful].
	   convResidences isNotEmpty ifTrue:
			[convResidences := convResidences collect: [ :r| r occupants awareness: ConsumptionAware. r ]].
		self convertedResidences at: i put: convResidences. 
		((i + 1) <= self nbOfTimes) ifTrue:  
			[self residences at: (i + 1) put: 
				( (self residences at: i) select: [:e | (convResidences includes: e) not ])].]
	
	
	
	
	
	

	