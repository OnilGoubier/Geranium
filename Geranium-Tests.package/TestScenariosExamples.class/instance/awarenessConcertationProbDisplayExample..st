as yet unclassified
awarenessConcertationProbDisplayExample: aSymbol

"
TestScenariosExamples new awarenessConcertationProbDisplayExample: #AwarenessByConcertationCostEstimation
"
	| cR |
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	cR := visitor awarenessByConcertation computeSuccessProbabilities: 4.
	cR inspect.
	
	[ cR totalSuccessProbabilities  connectedDottedPlot: Color red withCaption: 'Awareness by Concertation Probabilities'] value inspect.
	
	