*Geranium-Distributions
dottedPointPlot: aColor
	"
	{1@2 . 2@3 . 4@5} dottedPointPlot: Color red
	"
	| b ds |
	b := RTGrapher new.
	
	"We defien the size of the charting area"
	b extent: self vizSize.
	
	ds := GeraniumData new.
	ds dotShape rectangle color: aColor.
	"When the mouse is above a bar, say which class we are point at"
	ds interaction popup.
	ds points: self.
	"self halt."
	ds x: #x.
	ds y: #y.
	"self halt."
	ds dotShapeWithTitle: [ :value | '##', value asString ] color: Color red.
	b add: ds.
	^ b 	