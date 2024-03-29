as yet unclassified
roassalExamples

"
TestGraphicExamples new roassalExamples
"

|data g c ds b|

data := #(20 30 50 100).

	c := RTComposer new.

	"First visualization"
	g := RTGrapher new.
	g extent: 200 @ 200.
	g view: c view.
	ds := RTData new.
	ds label: 'test'. "this does not work"
	ds interaction popup.
	ds barShape color: Color blue.
	ds points: data.
	g add: ds.
	g axisX noTick; noLabel.
	g build.
	c group: #graph.

	"Second visualization"
	b := RTPieBuilder new.
	b view: c view.
	b interaction popup.
	b objects: data.
	b slice: #yourself.	
	b labeled.
	b build.
	c group: #pie.

	"Layouting"
	c move: #graph onTheLeftOf: #pie.

	RTMetricNormalizer new
		view: c view;
		objects: data;
		distinctColor.

	c view inspect