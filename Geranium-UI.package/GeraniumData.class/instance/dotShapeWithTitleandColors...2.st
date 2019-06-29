public - bar shape
dotShapeWithTitleandColors: anOrderedCollection  
	"Draw a bar chart with title"
	self dotShape.
	elementActions add: [ :someElements | 
		| lbl |
		self selectElementsForAddingBarTitle doWithIndex: [ :e :index |
			| modelToBeUsed |
			modelToBeUsed := self getModelForElement:e atIndex: index.
			lbl := (RTLabel new text: ((anOrderedCollection at: index) at: 1); color: Color red) 
						elementOn: modelToBeUsed.
			e shape color: ((anOrderedCollection at: index) at: 1). 
			TRConstraint move: lbl above: e.
			elements anyOne view add: lbl.
		] ].
	 