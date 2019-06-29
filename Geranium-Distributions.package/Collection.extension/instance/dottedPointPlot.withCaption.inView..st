*Geranium-Distributions
dottedPointPlot: aColor withCaption: aString inView: aView
	
	"#(1@2 2@3 4@5) 
		dottedPointPlot: Color red withCaption: 'hallo'"
	
	| b ds |
	b := RTGrapher new.
	aView ifNotNil: [ b view: aView ].
	"We defien the size of the charting area"
	"b extent: self vizSize."
	
	ds := RTData new.
	ds dotShape rectangle color: aColor.
	"When the mouse is above a bar, say which class we are point at"
	ds interaction popup.
	ds points: self.
	ds x: #x.
	ds y: #y.
	b add: ds.	
	self addLabel: aString onGraph: b.
	^ b 
	