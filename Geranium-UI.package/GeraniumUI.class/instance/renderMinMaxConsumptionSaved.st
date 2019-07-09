rendering
renderMinMaxConsumptionSaved
	minMaxConsumptionLabels
		ifNil: [ "should be se by the dsl normally"
			minMaxConsumptionLabels := {((self
				boxColored: (Color green alpha: 0.3))
				translateTo: (self relativeToBoundingBox: -45 @ 37)).
			((self label: '830,7' , 'MWh' colored: #black)
				translateTo: (self relativeToBoundingBox: -43.6 @ 37)).
			((self boxColored: (Color red alpha: 0.3))
				translateTo: (self relativeToBoundingBox: -45 @ 40)).
			((self label: '3 714,5' , 'MWh' colored: #black)
				translateTo: (self relativeToBoundingBox: -43.5 @ 40))
			"edge := (RTLine new color: Color orange; width: 1) edgeFrom: a to: b"	"width: 2; color: Color orange."}
				do: [ :i | mapView view add: i ] ]