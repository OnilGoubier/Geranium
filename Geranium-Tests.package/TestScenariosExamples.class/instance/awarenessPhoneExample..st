as yet unclassified
awarenessPhoneExample: aSymbol

"
TestScenariosExamples new awarenessPhoneExample: #AwarenessByPhoneCostEstimation
"
	| cR |
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	"profile inspect."
	visitor awarenessByPhone: (visitor visitAwarenessTelephoneCostProfile: profile).
	visitor inspect.
	cR := visitor awarenessByPhone convertResidences.
	cR inspect.
	