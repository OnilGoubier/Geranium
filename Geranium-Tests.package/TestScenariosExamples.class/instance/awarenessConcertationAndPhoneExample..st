as yet unclassified
awarenessConcertationAndPhoneExample: aSymbol

"
TestScenariosExamples new awarenessConcertationAndPhoneExample: #AwarenessByConcertationCostEstimation
"
	| cR myPoints tc awc initRSize cR1 myPoints1|
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	profile := Profile retrieve: aSymbol.
	profile successProbabilities.
	initRSize := visitor residences size.
	
	awc := visitor awarenessCampaign.
	cR := awc awarenessConcertations.
	cR1 := awc awarenessPhoneCalls.
	awc inspect.

	tc := 0.
	"myPoints := 
		cR convertedResidences collect: 
		[ :cr | | p | tc :=(cr size + tc). 
							p := tc / (cR residences at:1) size.
							p asFloat].
	[ myPoints connectedDottedPlot: Color red withCaption: 'Awareness by Concertation Conversion'] value inspect.	
   myPoints inspect."
myPoints := OrderedCollection new.
myPoints1 := OrderedCollection new.
cR do: [ :each | | p | tc :=(each convertedResidences size + tc).
		 myPoints add: (tc / initRSize) asFloat ].
	"cR convertedResidences with: cR residences do: 
		[ :cr :r | myPoints add: cr size / r size ]."
	[ myPoints connectedDottedPlot: Color red withCaption: 'Awareness by Concertation Conversion'] value inspect.
myPoints inspect.

myPoints1 := OrderedCollection new.
cR1 do: [ :each | 
		 myPoints1 add: each convertedResidences  size / each residences size ].
	"cR convertedResidences with: cR residences do: 
		[ :cr :r | myPoints add: cr size / r size ]."
	[ myPoints1 connectedDottedPlot: Color blue withCaption: 'Awareness by Phone Conversion'] value inspect.
myPoints1 inspect.