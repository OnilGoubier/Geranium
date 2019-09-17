computing
totalSuccessProbabilityFor: aNumber

	| nb |

	aNumber <= 0 ifTrue: [nb := 1].
	(aNumber > 0 and: aNumber <= 3) ifTrue: [ nb := aNumber ].
	aNumber > 3 ifTrue: [nb := 3].
	^ (self class initialProbability * ( 2.71828 raisedTo: (0.7069 *nb))) 