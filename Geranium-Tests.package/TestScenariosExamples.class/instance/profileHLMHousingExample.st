as yet unclassified
profileHLMHousingExample

"
TestScenariosExamples new profileHLMHousingExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	"scenario inspect."
	profile := Profile retrieve: #HLMHousing.
	profile awareness.
	profile inspect.
	