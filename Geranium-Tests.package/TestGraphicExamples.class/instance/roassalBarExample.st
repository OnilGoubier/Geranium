as yet unclassified
roassalBarExample

"
TestGraphicExamples new roassalBarExample
"

|data g c ds b|

data := #(20 30 50 100).

	c := RTComposer new.

	"First visualization"
	g := RTGrapher new.
	g extent: 200 @ 200.
	g view: c view.
	ds := RTData new.
	ds interaction popup.
	ds barShape color: Color blue.
	ds points: data.
	g add: ds.
	g axisX noTick; noLabel.
	g build.
	c group: #graph.

	RTMetricNormalizer new
		view: c view;
		objects: data;
		distinctColor.
		
	c view inspect.