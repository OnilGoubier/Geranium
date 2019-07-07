public - bar shape
barChartWithBarCenteredTitleAndColorFrom: aDictionary
	"Draw a bar chart with title"
	self barShape.
	"self halt."
	elementActions add: [ :someElements | 
		| lbl |
		self selectElementsForAddingBarTitle doWithIndex: [ :e :index |
			| modelToBeUsed |
			modelToBeUsed := self getModelForElement:e atIndex: index.
			"self halt."
			"lbl := (RTLabel new text: (((aDictionary keys at: index) asString) ); color: (aDictionary values at: index)) 
						elementOn: modelToBeUsed.
			e trachelShape color: (aDictionary values at: index)."
			lbl := (RTLabel new text: ((modelToBeUsed asString) ); color: (aDictionary at: modelToBeUsed )) 
						elementOn: modelToBeUsed.
			e trachelShape color: (aDictionary at: modelToBeUsed ).
			TRConstraint move: lbl above: e.
			elements anyOne view add: lbl.
		] ].
	 