as yet unclassified
findBuildings

		^report inputVisitor buildings

"buildings := (report inputVisitor buildings collect: [ :b | b residences ]) deepFlatten.
		building_to_type := [: b | (report inputVisitor modelToScenarioDict at: b) first].
		types := (buildings collect: 
			[: b | building_to_type value: b]) asSet asOrderedCollection sort: [:a :b | a name asString 				caseInsensitiveLessOrEqual: b name asString].
		
		typeSurfaceSizeAll := OrderedCollection new.
		types do: 
			[ :t | | typeColor cl | 
					oSize := OrderedCollection new.
					avSurface := OrderedCollection new.
					(buildings select: 
					[ :b | (building_to_type value: b) = t])
					do: 
						[ :e | 					
						oSize add: e occupantSize.
						avSurface add: e surface.].
						typeSurfaceSize := Array new: 2.
						typeColor := Array new: 2.
						typeColor at: 1 put: t name asString.
						cl := self typesColors at: t name.
						typeColor at: 2 put: cl.
						typeSurfaceSize at: 1 put: typeColor.
						typeSurfaceSize at: 2 put: (Point x: (oSize average asFloat round: 1) y: (avSurface average asFloat round: 1)).
						typeSurfaceSizeAll add: typeSurfaceSize.	
		]."