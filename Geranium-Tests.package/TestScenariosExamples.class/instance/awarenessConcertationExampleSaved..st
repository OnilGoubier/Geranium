as yet unclassified
awarenessConcertationExampleSaved: aSymbol

"
TestScenariosExamples new awarenessConcertationExample: #AwarenessByConcertationCostEstimation
"
	| cR myPoints tc |
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	cR := visitor awarenessByConcertation.
	cR inspect.

	tc := 0.
	myPoints := 
		cR convertedResidences collect: 
		[ :cr | | p | tc :=(cr size + tc). 
							p := tc / (cR residences at:1) size.
							p asFloat].
	[ myPoints connectedDottedPlot: Color red withCaption: 'Awareness by Concertation Conversion'] value inspect.	
   myPoints inspect.