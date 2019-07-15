examples
buildingDistributionExample

	"
	self buildingDistributionExample
	"
	|scenario|
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	scenario inspect.