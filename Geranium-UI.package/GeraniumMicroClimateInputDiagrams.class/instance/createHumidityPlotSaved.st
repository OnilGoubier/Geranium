initialization
createHumidityPlotSaved

	| processed |
	humidityPlot := RoassalModel new.
	humidityPlot script: [ :v :c | 
		|b|
		processed ifNil: [processed := true. self processCanvas: c and: v].
		b := report input climateProfile humidityPlot.
		b axisX
			noDecimal;
			title: 'Hour'.
		b axisY
			noDecimal;
			title: 'Humidity'.
		b view: v.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		"v @ (RTGridView new gridSize: 10)."
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.
		v.
	].
	