initialization
createIndividualConsumptionPlot

	
	| b processed lb |
	individualConsumption  := RoassalModel new.
	individualConsumption script: [ :v :c | 
		| historyUpTillNow individualHistoryUpTillNow deviationDataPoints showMin showMax surfaceDict oSizeDict tempCol| 
		processed ifNil: [processed := true. self processCanvas: c and: v].
		showMin := step < 24
		ifTrue: [ 1 ]
		ifFalse: [ step // 24 * 24 ].
		showMax := step + 1.
		surfaceDict := self surfaceSumPerType.
		oSizeDict := self occupantSizeSumPerType.
		historyUpTillNow := (self consumptionHistoryFrom: showMin To: showMax) allButFirst.
		
		individualHistoryUpTillNow := OrderedCollection new.
		tempCol := OrderedCollection new.
		"self buildingProfileNames with: surfaceDict keys do: [ :name :k | tempCol add:  ]"
		surfaceDict keys with: historyUpTillNow  do: 
			[ :key :h | 
				individualHistoryUpTillNow add: (h/(surfaceDict at: key))/(oSizeDict at: key) * 1000 ].
			
			"self halt."
		
		deviationDataPoints := historyUpTillNow.	"should compute it here -- not used by the viz yet"
		"myColors := self addTypesColors."
		b := self
			deviationGraphIn: v
			for: individualHistoryUpTillNow
			and: deviationDataPoints
			usingTypeColorDict: self typesColors.
		b axisX
			noDecimal;
			title: 'Time'.
		b axisY
			title: 'individual consumption Wh/m2'.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		"v @ RTDraggableView."
		"v @ (RTGridView new gridSize: 10)."
		lb := RTLegendBuilder new.
		lb view: v.
		"lb addText: 'System complexity view'."
		"self buildingProfileNames doWithIndex: [ :name :index |  lb addColorFadingFrom: (Color distinctTenStrongColors at: index) to: Color black text: name]."

		self buildingProfileNames doWithIndex: [ :name :index | lb addColorFadingFrom: (self typesColors at: name asSymbol) to: Color black  text: name].
		lb build.
		"v @ RTZoomableView.
		v @ RTDoubleScrollBar."
		v
	]