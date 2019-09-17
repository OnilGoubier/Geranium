as yet unclassified
awarenessConcertationAndPhoneMultipleGraphsExample

"
TestScenariosExamples new awarenessConcertationAndPhoneMultipleGraphsExample
"
	| cR myPoints tc tc1 awc initRSize cR1 myPoints1 mpoints|
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	initRSize := visitor residences size.
	
	awc := visitor awarenessCampaign.
	cR := awc awarenessConcertations.
	cR1 := awc awarenessPhoneCalls.
	awc inspect.

	tc := 0.
	tc1 := 0.

myPoints := OrderedCollection new.
myPoints1 := OrderedCollection new.
cR isEmpty 
	ifTrue: [ myPoints add: 0 ]
	ifFalse: 
		[cR do: [ :each | tc :=(each convertedResidences size + tc).
		 myPoints add: (tc / initRSize) asFloat * 100]].

myPoints1 := OrderedCollection new.
cR1 isEmpty 
	ifTrue: [ myPoints1 add: 0 ]
	ifFalse: 
		[
		cR1 do: [ :each | tc1 :=(each convertedResidences size + tc1).
		 myPoints1 add: (tc1 / initRSize) asFloat * 100 ]].

mpoints := { myPoints . myPoints1 }.
[mpoints connectedMultipleDottedPlots: { Color green . Color blue } 
	withLabels: { 'Concertation' . 'Phone' }
	withXYLabels: {'Converted residences %' . 'Nb Of Times' }.] value inspect.
