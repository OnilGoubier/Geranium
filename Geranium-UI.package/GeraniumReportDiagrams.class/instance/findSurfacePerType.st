as yet unclassified
findSurfacePerType

	|buildings building_to_type types typeSurface surface|
	
	buildings := self findBuildings.
	building_to_type := [: b | (report inputVisitor modelToScenarioDict at: b) first].
	types := self findBuildingTypes.
	
	typeSurface := Dictionary new.	
	
		types do: 
			[ :t | surface := OrderedCollection new.
					(buildings select: 
					[ :b | (building_to_type value: b) = t])
					do: 
						[ :e | 					
						surface add: e surface.].
						typeSurface at: t put: surface].
		^ typeSurface 