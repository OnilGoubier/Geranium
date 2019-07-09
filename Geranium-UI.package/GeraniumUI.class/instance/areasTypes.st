accessing
areasTypes
	
	^ areasTypes  ifNil: 
		[ areasTypes := Dictionary new]
				