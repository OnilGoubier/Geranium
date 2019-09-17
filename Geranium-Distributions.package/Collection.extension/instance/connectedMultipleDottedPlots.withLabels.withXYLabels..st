*Geranium-Distributions
connectedMultipleDottedPlots: someColors withLabels: someStrings withXYLabels: strings

	| b ds |
	
	"[#(#(3 4 6) #(2 3 4))
		connectedMultipleDottedPlots: { Color red . Color blue} withLabels: {'first' . 'second' } withXYLabels: {'hallo' . 'hi'}] value"
	
	b := RTGrapher new.
	"aView ifNotNil: [ b view: aView ]."
	b extent: self vizSize.
	
	1 to: self size do:
		[ :i |
		ds := RTData new.
		ds label: (someStrings at: i).
		ds points: (self at: i).
		ds connectColor: (someColors at: i).
		b add: ds.].
	
		
		
	"self size > 1 ifTrue: [
		b addDecorator: RTMeanDevVarDecorator new moveInFront
	]."
	strings ifNotNil: [b	axisY title: (strings at: 1); noDecimal.
								b axisX title: (strings at: 2); noDecimal.].
	b legend.
	^ b