accessing
resolveBuildings

	^ totalNumberOfBuildings
		ifNotNil: [  totalNumberOfBuildings next ]
		ifNil: [ nil ]