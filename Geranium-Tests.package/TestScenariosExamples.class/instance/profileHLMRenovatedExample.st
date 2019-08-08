as yet unclassified
profileHLMRenovatedExample

"
TestScenariosExamples new profileHLMRenovatedExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	"scenario inspect."
	profile := Profile retrieve: #HLMRenovated.
	profile awareness.
	profile inspect.
	