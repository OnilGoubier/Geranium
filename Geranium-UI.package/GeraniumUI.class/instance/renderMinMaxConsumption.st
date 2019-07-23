rendering
renderMinMaxConsumption
	minMaxConsumptionLabels
		ifNil: [ "should be se by the dsl normally"
			minMaxConsumptionLabels := {((self
				boxColored: (Color green alpha: 0.3))
				translateTo: (self relativeToBoundingBox: "-83"-77 @ 40)).
			((self label: '830,7' , 'MWh' colored: #black height: 3)
				translateTo: (self relativeToBoundingBox: "-80.6"-75.6 @ 40)).
			((self boxColored: (Color red alpha: 0.3))
				translateTo: (self relativeToBoundingBox: "-83" -77 @ 46)).
			((self label: '3 714,5' , 'MWh' colored: #black height: 3)
				translateTo: (self relativeToBoundingBox: "-80.5" -75.6@ 46))
			"edge := (RTLine new color: Color orange; width: 1) edgeFrom: a to: b"	"width: 2; color: Color orange."}
				do: [ :i | mapView view add: i ] ]