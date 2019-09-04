computing
computeSuccessProbabilities: aNumber

	|p sp|
	(aNumber <= 0) ifTrue: [ ^self ].
	sp := OrderedCollection new.
	1 to: aNumber do:
		[:i | sp add: (self totalSuccessProbabilityFor: i)].
		self totalSuccessProbabilities: sp.