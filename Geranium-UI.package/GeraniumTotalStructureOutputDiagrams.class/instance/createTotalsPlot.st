initialization
createTotalsPlot

	
	| b processed |
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
		v
	]