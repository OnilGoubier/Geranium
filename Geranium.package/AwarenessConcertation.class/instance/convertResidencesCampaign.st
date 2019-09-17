computing
convertResidencesCampaign

	|p convResidences|
	
		p := (self successProbabilityFor: qNumber ).
		self success probabilities: { p . 1-p }.
		
		"convResidences := OrderedCollection new."
		convResidences := self residences select: [ :r |self success next = Successful].
	   convResidences isNotEmpty ifTrue:
			[convResidences := convResidences collect: [ :r| r occupants awareness: ConsumptionAware. r ]].
		self convertedResidences: convResidences. 
		^convResidences 
	
	
	