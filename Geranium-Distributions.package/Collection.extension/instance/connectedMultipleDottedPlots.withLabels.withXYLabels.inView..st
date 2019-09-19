*Geranium-Distributions
connectedMultipleDottedPlots: someColors withLabels: someStrings withXYLabels: strings inView: aView

	| b ds |
	
	"[#(#(3 4 6) #(2 3 4))
		connectedMultipleDottedPlots: { Color red . Color blue} withLabels: {'first' . 'second' } withXYLabels: {'hallo' . 'hi'}] value"
	
	b := RTGrapher new.
	aView ifNotNil: [ b view: aView ].
	b extent: self vizSize.
	
	1 to: self size do:
		[ :i |
		ds := RTData new.
		ds label: (someStrings at: i).
		ds dotShape color: (someColors at: i).
		ds connectColor: (someColors at: i).
		ds points: (self at: i).		
		b add: ds.].

	strings ifNotNil: [b	axisY title: (strings at: 1); noDecimal.
								b axisX title: (strings at: 2); noDecimal.].
	b legend.
	^ b