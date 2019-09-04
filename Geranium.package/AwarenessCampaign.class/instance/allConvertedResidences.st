accessing
allConvertedResidences

	|res|
	convertedResidences isNil 
		ifTrue:[^self]
		ifFalse:
			[res := convertedResidences reject: [ :e | e isNil ]. 			
			^res flatten]