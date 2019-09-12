*Geranium-Distributions
pieUsingColor: aColorScheme inView: aView

	"{ #a -> 20 . #b -> 70 . #c -> 10 } pieUsingColor: 'Set1' "

	 | b sum percentages |
	
	sum := (self collect: [ :a | a value ]) sum.
	percentages := (self collect: [ :a | a key -> ((a value / sum) * 100) ]) asDictionary.
	
	b := RTPieBuilder new. 
	b view: aView.
	b interaction popup.
	b objects: self.
	b slice: [:assoc | assoc value].
	b labeled: [ :assoc | assoc key asString , ': ' , ((percentages at: assoc key)printShowingDecimalPlaces: 1) , '%' ].
	b color: aColorScheme.
	^ b