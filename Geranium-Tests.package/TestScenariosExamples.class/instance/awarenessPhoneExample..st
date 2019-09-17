as yet unclassified
awarenessPhoneExample: aSymbol

"
TestScenariosExamples new awarenessPhoneExample: #AwarenessByPhoneCostEstimation
"
	| cR awc myPoints |
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	awc := visitor awarenessCampaign.
	cR := awc awarenessPhoneCalls.
	awc inspect.
	
	myPoints := OrderedCollection new.
	cR do: [ :each | 
		 myPoints add: each convertedResidences  size / each residences size ].
	"cR convertedResidences with: cR residences do: 
		[ :cr :r | myPoints add: cr size / r size ]."
	[ myPoints connectedDottedPlot: Color red withCaption: 'Awareness by Phone Conversion'] value inspect.
	
	