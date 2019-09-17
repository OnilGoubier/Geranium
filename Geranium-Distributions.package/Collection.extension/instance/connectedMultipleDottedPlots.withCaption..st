*Geranium-Distributions
connectedMultipleDottedPlots: someColors withCaption: aString

	| b ds |
	
	"#(#(3 4 6) #(2 3 4))
		connectedMultipleDottedPlot: { Color red . Color blue} withCaption: 'hallo'] value"
	
	b := RTGrapher new.
	"aView ifNotNil: [ b view: aView ]."
	b extent: self vizSize.
	
	1 to: self size do:
		[ :i |
		ds := RTData new.
		ds points: (self at: i).
		ds connectColor: (someColors at: i).
		b add: ds.
		b
			axisX;
			axisY.].
	"self size > 1 ifTrue: [
		b addDecorator: RTMeanDevVarDecorator new moveInFront
	]."
	aString ifNotNil: [self addLabel: aString onGraph: b].
	^ b