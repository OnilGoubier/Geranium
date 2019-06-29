*Geranium-Distributions
dottedPointPlotWithLabelWithColors
	"
	{{{'hello' . (Color red)} . (1@2)} . {{'bonjour' . (Color blue)}. (3@4)} . {{'coucou' . (Color green)} . (5@6)}} dottedPointPlotWithLabelWithColors: Color red
	"
	| b ds ps|
	b := RTGrapher new.
	
	"We defien the size of the charting area"
	b extent: self vizSize.
	ps := (self collect: [ :e | e second]).
	ds := GeraniumData new.
	ds dotShape rectangle "color: aColor".
	"When the mouse is above a bar, say which class we are point at"
	"ds interaction popup."
	ds points: ps.
	ds x: #x.
	ds y: #y.
	ds dotShapeWithTitleAndColors: (self collect: [ :e | e first ]).
	b add: ds.
	^ b 	