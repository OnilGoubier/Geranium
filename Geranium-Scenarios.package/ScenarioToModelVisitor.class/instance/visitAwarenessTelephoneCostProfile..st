visiting
visitAwarenessTelephoneCostProfile: anAwarenessTelephoneCostProfile

	| awPhoneCalls rsize nbTimes costPerResidence totalCost|
	
	nbTimes := anAwarenessTelephoneCostProfile nbOfTimes.
	costPerResidence := anAwarenessTelephoneCostProfile costPerResidence.	
	(nbTimes <= 0) 
		ifTrue: [ rsize := 0 ] ifFalse: [ rsize := nbTimes ].
	awPhoneCalls := Array new: rsize.
	1 to: nbTimes do: [  :i || a |
			a := AwarenessPhoneCall new.
			a nbOfTimes: nbTimes.
			a residences: OrderedCollection new.
				"(self residences select: [:r | r occupants awareness = ConsumptionUnaware ])".
			a success: ( anAwarenessTelephoneCostProfile successProbabilities: i).
			a convertedResidences: OrderedCollection new.
			a costPerResidence: costPerResidence next.
			a totalCost: (a residences size) * a costPerResidence.
			awPhoneCalls at: i put: a].
	^ awPhoneCalls
	