visiting
visitAwarenessCostProfile: anAwarenessCostProfile ofClass: aAwarenessClass

	| awCampaign rsize|
	
	awCampaign := aAwarenessClass new.
	awCampaign nbOfTimes: anAwarenessCostProfile nbOfTimes.
	(anAwarenessCostProfile nbOfTimes <= 0) 
		ifTrue: [ rsize := 1 ] ifFalse: [ rsize := anAwarenessCostProfile nbOfTimes ].
	awCampaign residences: (Array new: rsize).
	awCampaign residences at: 1 put: 
			(self residences select: [:r | r occupants awareness = ConsumptionUnaware ]).
	awCampaign success: anAwarenessCostProfile successProbabilities.
	awCampaign convertedResidences: (Array new: rsize).
	^ awCampaign
	