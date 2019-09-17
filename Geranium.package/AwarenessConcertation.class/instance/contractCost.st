accessing
contractCost

	contractCost isNil ifTrue: [ contractCost := 0 ].
	^contractCost