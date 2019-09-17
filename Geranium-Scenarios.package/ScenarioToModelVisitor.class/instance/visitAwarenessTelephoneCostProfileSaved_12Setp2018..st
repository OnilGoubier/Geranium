visiting
visitAwarenessTelephoneCostProfileSaved_12Setp2018: anAwarenessTelephoneCostProfile

	| awPhoneCall rsize|
	
	awPhoneCall := AwarenessPhoneCall new.
	awPhoneCall nbOfTimes: anAwarenessTelephoneCostProfile nbOfTimes.
	(anAwarenessTelephoneCostProfile nbOfTimes <= 0) 
		ifTrue: [ rsize := 1 ] ifFalse: [ rsize := anAwarenessTelephoneCostProfile nbOfTimes ].
	awPhoneCall residences: (Array new: rsize).
	awPhoneCall residences at: 1 put: 
			(self residences select: [:r | r occupants awareness = ConsumptionUnaware ]).
	awPhoneCall success: anAwarenessTelephoneCostProfile successProbabilities.
	awPhoneCall convertedResidences: (Array new: rsize).
	^ awPhoneCall
	