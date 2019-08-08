as yet unclassified
profileHLMNewExample

"
TestScenariosExamples new profileHLMNewExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	"scenario inspect."
	profile := Profile retrieve: #HLMNew.
	profile awareness.
	profile inspect.
	