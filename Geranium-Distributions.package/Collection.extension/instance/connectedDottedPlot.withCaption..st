*Geranium-Distributions
connectedDottedPlot: aColor withCaption: aString

	| b ds |
	
	"[|x| x:= PMGaussianGenerator new. 
	((1 to: 100) collect: [:i | x next]) 
		connectedDottedPlot: Color red withCaption: 'hallo'] value"
	
	b := RTGrapher new.
	"aView ifNotNil: [ b view: aView ]."
	b extent: self vizSize.
	ds := RTData new.
		ds points: self.
		ds connectColor: aColor.
		b add: ds.
	b
		axisX;
		axisY.
	"self size > 1 ifTrue: [
		b addDecorator: RTMeanDevVarDecorator new moveInFront
	]."
	aString ifNotNil: [self addLabel: aString onGraph: b].
	^ b