initialization
createExposurePlot

	| b ds exposures processed |
	
	
	exposurePlot := RoassalModel new.
	exposurePlot script: [ :v :c | 
		processed ifNil: [processed := true. self processCanvas: c and: v].
		exposures := (report inputVisitor residences collect: [ :r |  r exposure ]) frequencies. 
		1 to: 6 do: [ :i | (exposures keys includes: i) ifFalse: [ exposures at: i put: 0 ] ].

		exposures := exposures associations.
		b := RTGrapher new view: v.
		ds := RTData new.
			ds points: exposures;
				x: #key;
				y: #value.
			ds connectColor: Color blue.
			b add: ds.
		"b addDecorator: RTMeanDevVarDecorator new moveInFront."
		b axisX
			noDecimal;
			title: 'Exposure'.
		b minX: 0.
		b axisY
			"noDecimal;"
			title: "'Instances'" 'Nb of Residences'.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		v @ (RTGridView new gridSize: 10).
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.
		v.
	]