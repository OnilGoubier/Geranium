*Geranium-Distributions
dottedPointPlot
	"
	{1@2 . 2@3 . 4@5} dottedPointPlot
	"
	| b ds |
	b := RTGrapher new.
	
	"We defien the size of the charting area"
	b extent: self vizSize.
	
	ds := RTData new.
	"When the mouse is above a bar, say which class we are point at"
	ds interaction popup.
	ds points: self.
	ds x: #x.
	ds y: #y.
	ds dotShape rectangle color: Color blue.
	b add: ds.
	^ b
	