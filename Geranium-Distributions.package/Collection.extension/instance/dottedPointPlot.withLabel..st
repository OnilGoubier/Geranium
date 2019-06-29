*Geranium-Distributions
dottedPointPlot: aColor withLabel: aBlockOrSymbol
	"
	#(1@2 2@3 4@5) plot, not yet work (to do ?)
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
	ds x: #x.
	ds y: #y.
	ds dotShapeWithTitle: aBlockOrSymbol color: Color red.
	b add: ds.
	^ b 	