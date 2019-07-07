as yet unclassified
occupantSizeSumPerType

	|dict|
	
	dict := Dictionary new.
	(self findOccupantSizePerType) keysAndValuesDo: [:key :value | dict at: key put: value sum ].
	^ dict