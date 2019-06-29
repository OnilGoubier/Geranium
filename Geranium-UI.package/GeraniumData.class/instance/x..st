accessing
x: blockOrSymbol
	blockOrSymbol isSymbol
		ifTrue: [ self
				xElement: [ :anElement | 
					anElement model isDictionary
						ifTrue: [ anElement model at: blockOrSymbol ]
						ifFalse: [ (anElement model isKindOf: Point) 
							ifTrue: [ anElement model perform: blockOrSymbol ]
							ifFalse: [blockOrSymbol rtValue: anElement model ] ] ]]
		ifFalse: [ self xElement: [ :anElement | blockOrSymbol rtValue: anElement model ] ]