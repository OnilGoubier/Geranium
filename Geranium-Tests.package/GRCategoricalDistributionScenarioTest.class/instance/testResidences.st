tests
testResidences

	| areaOfInterest residences totalResidences 
	buildings numberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution|

	"we need a unified way to set the SEED for reproducible experiments"

	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: (Scenario retrieve: #GeraniumTest).
	{ visitor . areaOfInterest } inspect.
	self assert: areaOfInterest buildings size equals: 194.
	residences := (areaOfInterest buildings select: [ :b | b class = House ]) size 
	+ ((areaOfInterest buildings select: [ :b | b class = AppartmentBlock ]) 
			collect: [:block | block appartments values size]) sum.
	self assert: residences > 500.
	
	numberOfDeclaredResidences := scenario resolveResidences.
	resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	residenceDistribution := scenario urbanProfilesToPercentages.
	buildings := OrderedCollection new.
	
	totalResidences := 0.
	
[self check: numberOfDeclaredResidences versus: totalResidences] 
			"and: [ self check: numberOfDeclaredPopulation versus: totalPopulation ])"
			whileTrue: [ |building|
				building := (self visitNode: 
									(resolvedResidenceProfiles at: (residenceDistribution next))).
				(((building numberOfResidences > 1) and: ((totalResidences + building numberOfResidences) < numberOfDeclaredResidences)) or: (building numberOfResidences = 1))
					ifTrue: [ 
						buildings "double dispatch and traversal logic in the visitor makes sense here"
						add: building.
						building area: areaOfInterest .
						totalResidences := totalResidences + building numberOfResidences.
						]
			]. 