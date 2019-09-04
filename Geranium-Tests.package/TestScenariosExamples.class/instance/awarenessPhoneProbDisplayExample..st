as yet unclassified
awarenessPhoneProbDisplayExample: aSymbol

"
TestScenariosExamples new awarenessPhoneProbDisplayExample: #AwarenessByPhoneCostEstimation
"
	| cR |
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	"profile inspect."
	visitor awarenessByPhone: (visitor visitAwarenessCostProfile: profile ofClass: AwarenessPhoneCall).
	"visitor inspect."
	cR := visitor awarenessByPhone computeSuccessProbabilities: 4.
	cR inspect.
	
	[ cR successProbabilities  connectedDottedPlot: Color red withCaption: 'Awareness by Phone Probabilities'] value inspect.
	
	