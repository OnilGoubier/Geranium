tests
peakOffPeakHoursDisplayExample

"
TestScenariosExamples new peakOffPeakHoursDisplayExample
"

	|tm|
	
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	tm := areaOfInterest residences collect: [:r| r occupants peakOffPeakHours]. 
	tm frequencies associations pieUsingColor: 'Set3'.

	
	
	