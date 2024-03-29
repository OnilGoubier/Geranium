*Geranium-Distributions
ringPieUsingColor: aColorScheme

	"{ #a -> 20 . #b -> 70 . #c -> 10 } ringPieUsingColor: 'Set2' "

	 | b c g sum percentages|
	
	c := RTComposer new.
	
	g := RTGrapher new.
	g extent: self vizSize.
	g view: c view.
	
	sum := (self collect: [ :a | a value ]) sum.
	percentages := (self collect: [ :a | a key -> ((a value / sum) * 100) ]) asDictionary.
	
	
	b := RTPieBuilder new. 
	b view: c view.
	b shape current
		innerRadius: 70;
		externalRadius: 100.
	b interaction popup.
	b objects: self.
	b slice: [:assoc | assoc value].
	b labeled: [ :assoc | assoc key asString , ': ' , ((percentages at: assoc key)printShowingDecimalPlaces: 1) , '%' ].
	b build.
	b color: aColorScheme.
	c view inspect.