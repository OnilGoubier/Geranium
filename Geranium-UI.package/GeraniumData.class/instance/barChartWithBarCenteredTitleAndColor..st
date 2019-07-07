public - bar shape
barChartWithBarCenteredTitleAndColor: anOrderedCollection
	"Draw a bar chart with title"
	self barShape.
	"self halt."
	elementActions add: [ :someElements | 
		| lbl |
		self selectElementsForAddingBarTitle doWithIndex: [ :e :index |
			| modelToBeUsed |
			modelToBeUsed := self getModelForElement:e atIndex: index.
			lbl := (RTLabel new text: ((anOrderedCollection at: index) at: 1); color: ((anOrderedCollection at: index) at: 2)) 
						elementOn: modelToBeUsed.
			e trachelShape color: ((anOrderedCollection at: index) at: 2).
			TRConstraint move: lbl above: e.
			elements anyOne view add: lbl.
		] ].
	 