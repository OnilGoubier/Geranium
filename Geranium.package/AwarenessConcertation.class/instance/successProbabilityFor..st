computing
successProbabilityFor: aNumber

	|p ptot|
	
	aNumber < 0 
		ifTrue: [ ^ self ].
	p := Array new: aNumber.
	ptot := Array new: aNumber.
	((aNumber > 3) or: (aNumber =0) )
		ifTrue: [ ^ 0 ]
		ifFalse:
			[p at: 1 put: ("self class initialProbability * (2.71828 raisedTo: (0.7069 * 1))"
								self totalSuccessProbabilityFor: 1).
			 ptot at: 1 put: (p at: 1).	
			2 to: aNumber do:
				[:i |
				ptot at: i put: ("self class initialProbability * (2.71828 raisedTo: (0.7069 * i))"
									  self totalSuccessProbabilityFor: i).
				p at: i put: ((ptot at: i )- (ptot at: i-1))* ((1+(((self allConvertedResidences)  size )/(( (self residences at: i) size ))asFloat))).
				]].
	^ p at: aNumber