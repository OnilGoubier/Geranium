as yet unclassified
awarenessConcertationAndPhoneMultipleGraphsCostExample

"
TestScenariosExamples new awarenessConcertationAndPhoneMultipleGraphsCostExample
"
	| cR myPoints tc tc1 awc cR1 myPoints1 mpoints|
	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	
	awc := visitor awarenessCampaign.
	cR := awc awarenessConcertationCost.
	cR1 := awc awarenessPhoneCallCost.
	awc inspect.

	tc := 0.
	tc1 := 0.

myPoints := OrderedCollection new.
cR isEmpty 
	ifTrue: [ myPoints add: 0 ]
	ifFalse: 
		[cR do: [ :each | tc :=each + tc.
		 myPoints add: tc ]].

myPoints1 := OrderedCollection new.
cR1 isEmpty 
	ifTrue: [ myPoints1 add: 0 ]
	ifFalse:
		[cR1 do: [ :each | tc1 :=each  + tc1.
		 myPoints1 add: tc1 ]].

mpoints := { myPoints . myPoints1 }.
[mpoints connectedMultipleDottedPlots: { Color purple . Color orange  } 
	withLabels: { 'Concertation' . 'Phone' }
	withXYLabels: {'Cost' . 'Nb Of Times' }.] value inspect.
