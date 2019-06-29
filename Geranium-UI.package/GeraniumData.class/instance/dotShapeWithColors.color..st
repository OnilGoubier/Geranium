public - bar shape
dotShapeWithColors: anOrderedCollection  color: aColor
	"Draw a bar chart with title"
	self dotShape.
	elementActions add: [ :someElements | 
		| lbl |
		self selectElementsForAddingBarTitle doWithIndex: [ :e :index |
			| modelToBeUsed |
			modelToBeUsed := self getModelForElement:e atIndex: index.
			lbl := (RTLabel new text: (anOrderedCollection at: index); color: aColor) 
						elementOn: modelToBeUsed.
			TRConstraint move: lbl above: e.
			elements anyOne view add: lbl.
		] ].
	 