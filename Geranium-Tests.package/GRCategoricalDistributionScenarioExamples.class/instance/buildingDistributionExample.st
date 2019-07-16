tests
buildingDistributionExample

	"
	GRCategoricalDistributionScenarioExamples new buildingDistributionExample
	"
	
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	scenario inspect.
	