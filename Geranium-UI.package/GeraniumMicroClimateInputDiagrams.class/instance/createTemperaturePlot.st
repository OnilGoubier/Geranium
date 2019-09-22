initialization
createTemperaturePlot
	
	"| processed |"
	temperaturePlot := RoassalModel new.
	temperaturePlot script: [ :v :c | 
		|b|
		"processed ifNil: [processed := true. self processCanvas: c and: v]."
		b := report input climateProfile dailyTemperaturePlot.
		b view: v.
		b axisX
			noDecimal;
			title: 'Day'.
		b axisY
			noDecimal;
			title: 'Temperature'.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		v @ (RTGridView new gridSize: 8).
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.
		v
	].
	