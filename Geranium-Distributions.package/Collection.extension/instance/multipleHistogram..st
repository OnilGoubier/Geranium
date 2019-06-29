*Geranium-Distributions
multipleHistogram: aColor
	"
	#(#('hello' 1 2) #('bonjour' 3 4)) multipleHistogram: Color blue
	"
	| b ds |
	b := RTGrapher new.
	
	"We defien the size of the charting area"
	b extent: self vizSize.
	
	ds := RTHorizontalMultipleData new.
	ds barShape color: aColor.
	"When the mouse is above a bar, say which class we are point at"
	"ds interaction popup."
	ds points: self.
	ds addMetric: #second.
	ds addMetric: #third.
	ds barChartWithBarTitle: #first rotation: -30.
	b add: ds.
	^ b 	