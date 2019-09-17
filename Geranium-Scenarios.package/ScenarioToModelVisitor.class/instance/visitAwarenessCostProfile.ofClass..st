visiting
visitAwarenessCostProfile: anAwarenessCostProfile ofClass: aAwarenessClass

	|awCampaigns rsize nbTimes|
	
	nbTimes := anAwarenessCostProfile nbOfTimes.
	(nbTimes <= 0) 
		ifTrue: [ rsize := 1 ] ifFalse: [ rsize := nbTimes ].
	awCampaigns := Array new: rsize.
	1 to: nbTimes do: [  :i || a |
			a := aAwarenessClass new.
			a nbOfTimes: nbTimes.
			a residences: 
				(self residences select: [:r | r occupants awareness = ConsumptionUnaware ]).
			a success: (anAwarenessCostProfile successProbabilities: i).
			a convertedResidences: OrderedCollection new.
			awCampaigns at: i put: a].
	^ awCampaigns
	