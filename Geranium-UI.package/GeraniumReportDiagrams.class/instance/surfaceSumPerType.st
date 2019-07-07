as yet unclassified
surfaceSumPerType

	|dict|
	
	dict := Dictionary new.
	(self findSurfacePerType) keysAndValuesDo: [:key :value | dict at: key put: value sum ].
	^ dict
	