as yet unclassified
scenarioExample

"
TestScenariosExamples new scenarioExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	"scenario inspect."
	profile := Profile retrieve: #HLMRenovated.
	profile awareness.
	profile inspect.
	