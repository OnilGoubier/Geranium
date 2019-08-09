as yet unclassified
profileResidenceExample: aSymbol

"
TestScenariosExamples new profileResidenceExample: #HLMRenovated
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	profile := Profile retrieve: aSymbol.
	profile awareness.
	profile inspect.
	