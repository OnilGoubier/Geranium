initialization
createMultipleBarStack
	
	| buildings  types type_colors building_to_type processed avSurface typeSurfaceSize typeSurfaceSizeAll oSize|
	
	multipleBarStack := RoassalModel new.
	multipleBarStack  script: [ :v :c |
		| g |
		processed ifNil: [processed := true. self processCanvas: c and: v].
		buildings := (report inputVisitor buildings collect: [ :b | b residences ]) deepFlatten.
		building_to_type := [: b | (report inputVisitor modelToScenarioDict at: b) first].
		types := (buildings collect: 
			[: b | building_to_type value: b]) asSet asOrderedCollection sort: [:a :b | a name asString 				caseInsensitiveLessOrEqual: b name asString].
		"typeSize := Dictionary new.
		typeSurface := Dictionary new."
		
		typeSurfaceSizeAll := OrderedCollection new.
		types do: 
			[ :t | 
				(buildings select: 
					[ :b | (building_to_type value: b) = t])
				do: 
					[ :e |  
					oSize := OrderedCollection new.
					avSurface := OrderedCollection new.
					oSize add: e occupantSize.
					avSurface add: e surface.].
					typeSurfaceSize := Array new: 3.
					typeSurfaceSize at: 1 put: t name.
					typeSurfaceSize at: 2 put: avSurface average.
					typeSurfaceSize at: 3 put: (avSurface average)/(oSize average) asFloat.
					typeSurfaceSizeAll add: typeSurfaceSize.	
		].
		
		g := typeSurfaceSizeAll asArray multipleHistogram: (Color blue) withCaption: nil inView: v. 
		
		g axisY
			noDecimal;
			title: 'Avg. Surface'.
		g build.
		g view.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		v @ (RTGridView new gridSize: 10).
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.

	]