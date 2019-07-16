initialization
createTotalsPlot

	
	| b processed lb |
	totalsPlot := RoassalModel new.
	totalsPlot script: [ :v :c | 
		| historyUpTillNow deviationDataPoints showMin showMax|
		processed ifNil: [processed := true. self processCanvas: c and: v].
		showMin := step < 24
		ifTrue: [ 1 ]
		ifFalse: [ step // 24 * 24 ].
		showMax := step + 1.
		historyUpTillNow := (self consumptionHistoryFrom: showMin To: showMax) allButFirst.
		deviationDataPoints := historyUpTillNow.	"should compute it here -- not used by the viz yet"
		"myColors := self addTypesColors."
		b := self
			deviationGraphIn: v
			for: historyUpTillNow
			and: deviationDataPoints
			usingTypeColorDict: self typesColors.
		b axisX
			noDecimal;
			title: 'Time'.
		b axisY
			title: 'kWh'.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		"v @ RTDraggableView."
		"v @ (RTGridView new gridSize: 10)."
		"lb := RTLegendBuilder new.
		lb view: v."
		"lb addText: 'System complexity view'."
		"self buildingProfileNames doWithIndex: [ :name :index |  lb addColorFadingFrom: (Color distinctTenStrongColors at: index) to: Color black text: name]."

		"self buildingProfileNames doWithIndex: [ :name :index | lb addColorFadingFrom: (self typesColors at: name asSymbol) to: Color black  text: name].
		lb build."
		"v @ RTZoomableView.
		v @ RTDoubleScrollBar."
		v
	]