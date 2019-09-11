tests
transportModeDisplayExample

"
TestScenariosExamples new transportModeDisplayExample
"

	|tm|
	
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	tm := areaOfInterest residences collect: [:r| r occupants transportMode]. 
	tm frequencies associations pieUsingColor: 'Set2'.

	
	
	