computing
successProbabilityFor: aNumber

	aNumber < 0 ifTrue: [ ^ self ].
	aNumber > 3 ifTrue: [ ^ (self class initialProbability * ( 2.71828 raisedTo: (0.7069 * 3))) ]
				   ifFalse: [^ (self class initialProbability * ( 2.71828 raisedTo: (0.7069 * aNumber)))]