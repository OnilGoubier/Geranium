initialization
adjustDPE: categories

	|otherCategories difference differencePerCategory newCategories|

	otherCategories := categories select: [ :a | a key ~= DPEA ].
	difference := (categories asDictionary at: DPEA) - dpeAPercentage.
	differencePerCategory := difference / otherCategories size. 
	newCategories := (otherCategories sort: [:a :b | a value < b value]) collectWithIndex: [ :a :index |  
		a value + differencePerCategory < 0
			ifTrue: [ 
				difference := difference + a value. 
				otherCategories size - index = 0
					ifTrue: [ a key -> 0 ]
					ifFalse: [ 
						differencePerCategory := difference / (otherCategories size - index).
						a key -> 0
					] 
			] ifFalse: [ 
				a key -> (a value + differencePerCategory)
			] 
	].
	newCategories := newCategories asOrderedCollection addFirst: DPEA -> dpeAPercentage; yourself.
	^ newCategories