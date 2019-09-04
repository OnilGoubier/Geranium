computing
successProbabilityForAlt1: aNumber

	aNumber < 0 ifTrue: [ ^ self ].
	aNumber > 3 ifTrue: [ ^ 0 ]
				   ifFalse: [^ (self class initialProbability * ( 2.71828 raisedTo: (0.7069 * aNumber)))]