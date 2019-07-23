instance creation
for: aScenario
	"self halt."
	inputScenario := Scenario retrieve: aScenario. 
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: inputScenario. 
	"self halt."
	time := visitor years * 365 * 24.