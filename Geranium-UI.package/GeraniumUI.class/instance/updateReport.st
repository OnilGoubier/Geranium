updating
updateReport 
	"update report, according to a new scenario or an updated scenario"

	report := nil.
	
	^ self reportMutex critical: [
	"self halt.	"
		report isNil ifTrue:
			["self perform: self scenario."
			"min/max for non-hoping categories"
			report := GeraniumSimulation new
				for: #Geranium;
				run.
			Transcript show: (report whatIf at: #temperature ifAbsentPut: [0]); cr.
			report]].
	"^ report"
	
	
	