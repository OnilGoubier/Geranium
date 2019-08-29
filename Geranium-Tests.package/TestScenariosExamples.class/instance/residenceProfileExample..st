as yet unclassified
residenceProfileExample: aSymbol

"
TestScenariosExamples new residenceProfileExample: #HLMRenovated
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	profile := Profile retrieve: aSymbol.
	profile awareness.
	profile inspect.
	