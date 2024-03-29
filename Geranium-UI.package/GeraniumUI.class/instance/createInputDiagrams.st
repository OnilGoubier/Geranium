initialization
createInputDiagrams
	structuralInputDiagrams := GeraniumStructuralInputDiagrams new: self report. 
	socialInputDiagrams := GeraniumSocialInputDiagrams new: self report.
	microClimateInputDiagrams := GeraniumMicroClimateInputDiagrams new: self report.
	envAwarenessInputDiagrams := GeraniumEnvAwarenessInputDiagrams new: self report.
	"self halt."
	'createInputDiagrams' logCr.
	"passing initializers ?"
	"inputDiagrams := RoassalModel new.
	inputDiagrams
		script: [ :v :c | 
			(GeraniumReportVisualization new
				with: self report;
				inHorizontalExampleView: v) setCanvas: c ]"