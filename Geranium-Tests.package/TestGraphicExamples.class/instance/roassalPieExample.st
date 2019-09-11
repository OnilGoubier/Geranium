as yet unclassified
roassalPieExample
"
TestGraphicExamples new roassalPieExample
"

|data g c ds b|

data := #(20 30 50 100).

	c := RTComposer new.
	
	g := RTGrapher new.
	g extent: 200 @ 200.
	g view: c view.

	b := RTPieBuilder new.
	b view: c view.
	b interaction popup.
	b objects: data.
	b slice: #yourself.	
	b labeled.
	b build.
	c group: #pie.

	RTMetricNormalizer new
		view: c view;
		objects: data;
		distinctColor.

	c view inspect.