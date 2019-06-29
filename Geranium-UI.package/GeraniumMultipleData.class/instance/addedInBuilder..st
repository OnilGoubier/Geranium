adding
addedInBuilder: aBuilder
	super addedInBuilder: aBuilder.
	"aBuilder axisX noLabel; noTick."
	
	elements := RTGroup new.
	points do: [ :p | 
		| values es mypoint |
		"self halt."
		values := metrics collect: [ :m | m rtValue: p ].
		mypoint := Point x: values first y: values second.
		es := dotBuilder elementOn: mypoint.
		es trachelShape color: self defaultLabelColor.
		"es doWithIndex: [ :e :index | e trachelShape color: (self colorsToUse at: index) ]."
		groupedElements add: es.
		"elements addAll: es"
		elements add: es.
		 ] separatedBy: [ elements add: ((RTBox new size: 0) elementOn: 0) ]. "shape RTBox or RTEllipse?"
	   
	self addAll: elements