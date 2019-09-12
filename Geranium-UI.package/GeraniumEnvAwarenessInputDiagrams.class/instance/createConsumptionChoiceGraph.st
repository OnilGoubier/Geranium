accessing
createConsumptionChoiceGraph

	|stats |

	consumptionChoiceGraph := RoassalModel new.
	consumptionChoiceGraph
		script: [ :v :c | | b |
			self processCanvas: c and: v. 
			stats := (report inputVisitor residences collect: [ :r |  r occupants consumptionChoice ]) frequencies associations.
			b := stats ringPieUsingColor: 'Set2' inView: v.
			"color setting does not seem to work"
			"b normalizer normalizeColorUsing:  (RTColorPalette qualitative colors: 3 scheme:'Set2') reverse."
			b build.
			v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
			v @ RTDraggableView.
			"v @ (RTGridView new gridSize: 10)."
			v @ RTZoomableView.
			v @ RTDoubleScrollBar.
			v
	]