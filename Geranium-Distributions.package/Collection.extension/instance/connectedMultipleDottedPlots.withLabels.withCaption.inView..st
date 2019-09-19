*Geranium-Distributions
connectedMultipleDottedPlots: someColors withLabels: someStrings withCaption: aString inView: aView

	| b ds |
	
	"[#(#(3 4 6) #(2 3 4))
		connectedMultipleDottedPlots: { Color red . Color blue} withLabels: {'first' . 'second' } withCaption: 'hallo'] value"
	
	b := RTGrapher new.
	aView ifNotNil: [ b view: aView ].
	b extent: self vizSize.
	
	1 to: self size do:
		[ :i |
		ds := RTData new.
		ds label: (someStrings at: i).
		ds points: (self at: i).
		ds connectColor: (someColors at: i).
		b add: ds.].
		b
			axisX.
		
	aString ifNotNil: [b	axisY title: aString].
	b legend.
	^ b