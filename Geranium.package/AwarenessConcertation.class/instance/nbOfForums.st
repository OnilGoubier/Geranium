accessing
nbOfForums

	nbOfForums isNil ifTrue: [ nbOfForums := 0 ].
	^nbOfForums