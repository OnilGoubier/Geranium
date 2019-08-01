initialization
createAvSurfaceOccupantSizeDottedPlot
	
	| buildings  types building_to_type processed avSurface oSize typeSurfaceSize typeSurfaceSizeAll|
	
	avSurfaceOcSizePlot := RoassalModel new.
	avSurfaceOcSizePlot script: [ :v :c |
		| g |
		processed ifNil: [processed := true. self processCanvas: c and: v].
		buildings := (report inputVisitor buildings collect: [ :b | b residences ]) deepFlatten.
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
		].
		"typePoint := Dictionary new.
		typeSize  keys asOrderedCollection with: (typeSurface keys asOrderedCollection)
			do: [ :ka : kb| typePoint  at: ka put: (Point x: (typeSize at: ka) y: (typeSurface at: kb)) 				]."
							"self halt."
		g := typeSurfaceSizeAll dottedPointPlotWithLabelAndColorsInView: v.
		
		g axisX
			"noDecimal;"
			title: 'OccupantSize'.";
			fromPoint: 0@0."
		g axisY
			"noDecimal;"
			title: 'Avg. Surface'.
		"g addDecorator: (RTCursorFollower new color: Color blue)." "FOLLOWING WITH THE MOUSE..."
		"g minX: 0."
		g build.
		g view.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		"v @ (RTGridView new gridSize: 10)."
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.

	]