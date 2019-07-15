tests
residencesExample

"
GRCategoricalDistributionScenarioExamples new residencesExample
"

	| areaOfInterest totalResidences 
	buildings numberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes|

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	"{ visitor . areaOfInterest } inspect."
	"self assert: areaOfInterest buildings size equals: 194."
	"residences := (areaOfInterest buildings select: [ :b | b class = House ]) size 
	+ ((areaOfInterest buildings select: [ :b | b class = AppartmentBlock ]) 
			collect: [:block | block appartments values size]) sum.
	self assert: residences > 500."
	
	numberOfDeclaredResidences := scenario resolveResidences.
	resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	residenceDistribution := scenario urbanProfilesToPercentages. 
	buildings := OrderedCollection new.
	
	totalResidences := 0.
	
	[numberOfDeclaredResidences
			ifNil: [ true ]
			ifNotNil: [ totalResidences < numberOfDeclaredResidences ]]
			whileTrue: [ |building|
				building := (visitor visitNode: 
									(resolvedResidenceProfiles at: (residenceDistribution next))).
				(((building numberOfResidences > 1) and: ((totalResidences + building numberOfResidences) < numberOfDeclaredResidences)) or: (building numberOfResidences = 1))
					ifTrue: [ 
						buildings "double dispatch and traversal logic in the visitor makes sense here"
						add: building.
						building area: areaOfInterest .
						totalResidences := totalResidences + building numberOfResidences.
						]
			]. 
		visitor inspect.
		"buildings inspect."
		visitor buildings: buildings.
		"visitor residences inspect."
		residencesTypes := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).
		(residencesTypes frequencies) inspect.
		(residencesTypes identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect.