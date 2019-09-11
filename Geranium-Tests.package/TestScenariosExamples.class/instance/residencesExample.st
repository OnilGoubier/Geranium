tests
residencesExample

"
TestScenariosExamples new residencesExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	"residences := visitor residences."
	areaOfInterest residences inspect.
	
	
	