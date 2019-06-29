initialization
createAvSurfaceBarStack
	
	| buildings  types type_colors building_to_type processed lb avSurface|
	
	avSurfaceOcSizePlot := RoassalModel new.
	avSurfaceOcSizePlot script: [ :v :c |
		| h |
		processed ifNil: [processed := true. self processCanvas: c and: v].
		buildings := (report inputVisitor buildings collect: [ :b | b residences ]) deepFlatten."{ n_residences . n_occupants . block_or_house . type }"

		building_to_type := [: b | (report inputVisitor modelToScenarioDict at: b) first].
		types := (buildings collect: 
			[: b | building_to_type value: b]) asSet asOrderedCollection sort: [:a :b | a name asString caseInsensitiveLessOrEqual: b name asString].
		types do: [:_t | (buildings select: [ :b | (building_to_type value: b) = _t ] thenCollect: #occupantSize) average * 35]
	
		]