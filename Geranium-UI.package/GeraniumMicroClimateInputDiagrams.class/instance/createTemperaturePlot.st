initialization
createTemperaturePlot
	
	temperaturePlot := RoassalModel new.
	temperaturePlot script: [ :v :c | 
		|b|
		b := report input climateProfile temperaturePlot.
		b view: v.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ RTDraggableView.
		v @ (RTGridView new gridSize: 10).
		v @ RTZoomableView.
		v @ RTDoubleScrollBar.
		v
	].
	