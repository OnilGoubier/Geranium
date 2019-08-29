as yet unclassified
costProfileExample: aSymbol

"
TestScenariosExamples new costProfileExample: #AwarenessByPhoneCostEstimation
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	profile inspect.
	