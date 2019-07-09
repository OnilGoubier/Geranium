as yet unclassified
findOccupantSizePerType

	|buildings building_to_type types typeOccupantSize oSize|
	
	buildings := self findBuildings.
	building_to_type := [: b | (report inputVisitor modelToScenarioDict at: b) first].
	types := self findBuildingTypes.
	
	typeOccupantSize := Dictionary new.	
	
		types do: 
			[ :t | oSize := OrderedCollection new.
					"avSurface := OrderedCollection new."
					(buildings select: 
					[ :b | (building_to_type value: b) = t])
					do: 
						[ :e | 					
						oSize add: e occupantSize.
						"avSurface add: e surface."].
						typeOccupantSize at: t name put: oSize].
		^ typeOccupantSize 