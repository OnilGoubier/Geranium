as yet unclassified
dailyTemperatureSeries

"
TestScenariosExamples new dailyTemperatureSeries
"

	|cProfile|

	"self UrbanClimateA.
	scenario := Scenario retrieve: #UrbanClimateA."
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	cProfile := scenario resolveClimateProfile.
	"(cProfile computeYearlyTemperatureSeries) inspect."
	(cProfile computeDailyAverageForAYearTemperatureSeries) inspect.
	"ClimateProfile new computeYearlyTemperatureSeries "