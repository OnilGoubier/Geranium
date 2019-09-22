initialization
createPerBuildingTypePlot
	| b "processed" |
	buildingTypePlot := RoassalModel new.
	buildingTypePlot script: [ :v :c | 
		["processed ifNil: [processed := true. self processCanvas: c and: v]."
		b := ((self consumptionHistoryCumSumAt: step + 1) removeFirst; yourself)/1000
						asHistogramDifferentColors: self typesColors
						withCaption: nil
						inView: v
						describing:
							((self buildingProfileNames copy)
								yourself).	"scenarios per building is a collection -- fix !"
		b axisY
			title: 'Total MWh'.
		b build.
		v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
		v @ (RTGridView new gridSize: 10).
		v] on: Error do: [ v ]
	]
