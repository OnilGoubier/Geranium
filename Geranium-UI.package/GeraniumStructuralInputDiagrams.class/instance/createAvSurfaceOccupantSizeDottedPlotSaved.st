initialization
createAvSurfaceOccupantSizeDottedPlotSaved
	
	| buildings  types type_colors building_to_type processed typePoint avSurface typeSurface typeSize oSize|
	
	avSurfaceOcSizePlot := RoassalModel new.
	avSurfaceOcSizePlot script: [ :v :c |
		| g |
		processed ifNil: [processed := true. self processCanvas: c and: v].
		buildings := (report inputVisitor buildings collect: [ :b | b residences ]) deepFlatten.
		building_to_type := [: b | (report inputVisitor modelToScenarioDict at: b) first].
		types := (buildings collect: 
			[: b | building_to_type value: b]) asSet asOrderedCollection sort: [:a :b | a name asString 				caseInsensitiveLessOrEqual: b name asString].
		typeSize := Dictionary new.
		typeSurface := Dictionary new.
		types do: 
			[ :t | 
				(buildings select: 
					[ :b | (building_to_type value: b) = t])
				do: 
					[ :e |  
					oSize := OrderedCollection new.
					avSurface := OrderedCollection new.
					oSize add: e occupantSize.
					avSurface add: e surface.
					typeSize at: t put: oSize average.
					typeSurface at: t put: avSurface average].	
		].
		typePoint := Array new.
		"typeSize  keys asOrderedCollection with: (typeSurface keys asOrderedCollection)
			do: [ :ka : kb| typePoint  at: ka put: (Point x: (typeSize at: ka) y: (typeSurface at: kb)) 				]."
		g := typePoint values dottedPointPlot: Color blue withCaption: nil inView: v.
		
		g axisX
			noDecimal;
			title: 'OccupantSize'.
		g axisY
			noDecimal;
			title: 'Avg. Surface'.
		"g addDecorator: (RTCursorFollower new color: Color blue)." "FOLLOWING WITH THE MOUSE..."
		g build.
		g view.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		v @ (RTGridView new gridSize: 10).
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.

	]