*Geranium-Distributions
dottedPointWithLabelPlot: aColor inView: aView
	"
	{{'hello' . (1@2)} . {'bonjour'. (3@4)} . {'coucou' . (5@6)}} dottedPointWithLabelPlot: Color red
	"
	| b ds ps|
	b := RTGrapher new.
	aView ifNotNil: [ b view: aView ].
	"We defien the size of the charting area"
	b extent: self vizSize.
	ps := (self collect: [ :e | e second]).
	ds := GeraniumData new.
	ds dotShape rectangle color: aColor.
	"When the mouse is above a bar, say which class we are point at"
	"ds interaction popup."
	ds points: ps.
	ds x: #x.
	ds y: #y.
	ds dotShapeWithTitle: (self collect: [ :e | e first ]) color: Color red.
	b add: ds.
	^ b 	