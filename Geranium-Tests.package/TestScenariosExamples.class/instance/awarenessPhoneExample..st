as yet unclassified
awarenessPhoneExample: aSymbol

"
TestScenariosExamples new awarenessPhoneExample: #AwarenessByPhoneCostEstimation
"
	| cR myPoints |
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	"profile inspect."
	visitor awarenessByPhone: (visitor visitAwarenessCostProfile: profile ofClass: AwarenessPhoneCall).
	"visitor inspect."
	cR := visitor awarenessByPhone convertResidences.
	cR inspect.
	
	myPoints := OrderedCollection new.
	cR convertedResidences with: cR residences do: 
		[ :cr :r | myPoints add: cr size / r size ].
	[ myPoints connectedDottedPlot: Color red withCaption: 'Awareness by Phone Conversion'] value inspect.
	
	