*Geranium-Distributions
pie

	"{ #a -> 20 . #b -> 70 . #c -> 10 } pie"

	| b c g rm|
	
	c := RTComposer new.
	
	g := RTGrapher new.
	g extent: self vizSize.
	g view: c view.
	
	b := RTPieBuilder new. 
	b view: c view.
	b interaction popup.
	b objects: self.
	b slice: [:assoc | assoc value].
	"b normalizer distinctColor."
	b labeled: [ :assoc | assoc key ].
	"b emphasize: self first by: 20. ""could be min and max"
	"b emphasize: self second by: 20."
	b build.
		rm := RTMetricNormalizer new.
		rm view: c view;
		objects: self.
		rm elements with:(RTColorPalette qualitative colors: rm elements size scheme: 'Set1') do:
			[ :el :cl| el trachelShape color: cl].
	c view inspect.