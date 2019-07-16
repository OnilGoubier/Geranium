tests
residencesExampleMultiplied: aNumber

"
GRCategoricalDistributionScenarioExamples new residencesExampleMultiplied: 1
"

	| areaOfInterest totalResidences 
	buildings numberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes residencesTypesOrg buildingsOrg cmp|

	self fullGeraniumTestScript: aNumber.
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
	residenceDistribution := scenario urbanProfilesToPercentages. "self halt."
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
		"visitor inspect."
		"buildings inspect."
		visitor buildings: buildings.
		"visitor residences inspect."
		residencesTypes := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).
		"(residencesTypes frequencies) inspect."
		buildingsOrg := OrderedCollection new.
		cmp := Dictionary new.
		residenceDistribution categories with: (residenceDistribution probabilities) do: 
			[ :c :p | cmp at: c put: ({p} asOrderedCollection) ].
		(residencesTypes frequencies) keysAndValuesDo: 
			[ :k :v | | f tb mykey| ((k = #HLMNew) or: (k = #HLMRenovated)) 
									ifTrue:[ f := ((v/(12*aNumber)) asFloat rounded).
												mykey := k ,'Block'.
												tb :=  buildings select: 
																[:b | "self halt. "
																		(b isKindOf: AppartmentBlock)
																		and: 
																		((visitor modelToScenarioDict at: b) first name = mykey )].
												"self halt."
												buildingsOrg addAll: (tb first: f)]
									ifFalse: [f := ((v/aNumber) asFloat rounded).
												mykey := k.
												buildingsOrg addAll: (( buildings select: 
													[:b | ((b isKindOf: House)
															and: (((visitor modelToScenarioDict at: b) first) name = k))]) first: f)].
									(cmp at: mykey) add: f.
				 ].
		"buildingsOrg inspect."	
		visitor buildings: buildingsOrg.
		visitor residencesUpdate.
		"self halt."
		residencesTypesOrg := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).	
		(residencesTypesOrg  identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect.
		"(residencesTypes identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect."
		
		"((residencesTypesOrg frequencies) keysAndValuesDo:[ :k :v | ()/(buildingsOrg size))*100 asFloat round: 1]."
		cmp := cmp collect: [ :e | {(((e value at: 1)*100) asFloat round: 1) . ((((e value at: 2)/(buildingsOrg size))*100) asFloat round: 1)} ].
		cmp inspect.
