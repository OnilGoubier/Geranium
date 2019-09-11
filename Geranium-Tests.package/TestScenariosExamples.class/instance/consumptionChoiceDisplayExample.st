tests
consumptionChoiceDisplayExample

"
TestScenariosExamples new consumptionChoiceDisplayExample
"

	|tm|
	
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	tm := areaOfInterest residences collect: [:r| r occupants consumptionChoice]. 
	tm frequencies associations ringPieUsingColor: 'Set2'.

	
	
	