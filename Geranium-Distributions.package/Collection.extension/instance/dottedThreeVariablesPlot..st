*Geranium-Distributions
dottedThreeVariablesPlot: aColor
	"
	{{'hello' . (1@2)} . {'bonjour'. (3@4)} . {'coucou' . (5@6)}} dottedThreeVariablesPlot: Color blue.
	or
	#(#('hello' 1 2) #('bonjour' 3 4)) dottedThreeVariablesPlot: Color blue.	
	"
	| b ds |
	b := RTGrapher new.
	
	"We defien the size of the charting area"
	b extent: self vizSize.
	
	ds := GeraniumMultipleData new.
	ds dotShape rectangle color: aColor.
	"When the mouse is above a bar, say which class we are point at"
	"ds interaction popup."
	ds points: self.
	ds addMetric: #second.
	ds addMetric: #third.
	"ds x: #x.
	ds y: #y."
	ds dotShapeWithTitle: #first color: Color red.
	b add: ds.
	^ b 
	