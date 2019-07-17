tests
nbResidencesPerCategoryExampleBy: aNumber

"
GRCategoricalDistributionScenarioExamples new nbResidencesPerCategoryExampleBy: 100
"

	| areaOfInterest totalResidences nbCreatedResidencesPerCategory totResidencesPerCategory nbCreatedBuildingsPerCategory buildings buildingsOrg cmp mySum
	numberOfDeclaredResidences totalNumberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes residencesTypesOrg nbOfResidenceInBuilding|

	self geraniumStakeholderMeetingTEST.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := AreaOfInterest new.
	areaOfInterest coordinates: scenario coordinates.	
	numberOfDeclaredResidences := (scenario nbResidencesPerCategory) collect: [:e | e * aNumber]. "numberOfDeclaredResidences inspect."
	resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	"resolvedResidenceProfiles inspect."
	residenceDistribution := scenario urbanProfilesToPercentages.
	"residenceDistribution inspect. ""self halt."
	buildings := OrderedCollection new.	
	totalResidences := 0.
	totalNumberOfDeclaredResidences := numberOfDeclaredResidences values sum.
	nbOfResidenceInBuilding := 0.
	nbCreatedResidencesPerCategory := Dictionary new.
	nbCreatedBuildingsPerCategory := Dictionary new.
	totResidencesPerCategory := Dictionary new.
	
	[totalNumberOfDeclaredResidences
		ifNil: [ true ]
		ifNotNil: [ totalResidences < totalNumberOfDeclaredResidences ]]
		whileTrue: 
			[ |building residence category myProfile|
		"The following code is the key, to create a building according to the probabilities for each category presented in residenceDistribution variable"
			residence := (visitor visitNode: 
							(resolvedResidenceProfiles at: (residenceDistribution next))).
						"self halt."
			category := ((visitor modelToScenarioDict at: residence) first) name.
			totResidencesPerCategory at: category ifAbsentPut: 0.
			totResidencesPerCategory at: category put: (totResidencesPerCategory at: category)+1.
			(nbCreatedResidencesPerCategory at:category ifAbsentPut: 0) 
				< (numberOfDeclaredResidences at: category)
				ifTrue: 
					[(residence isKindOf: Appartement)
						ifTrue:
							[nbCreatedResidencesPerCategory at:category 
										put: (nbCreatedResidencesPerCategory at:category) +1.
							(((nbCreatedResidencesPerCategory at:category) % 12) = 0)
								ifTrue: "create a building containing 12 residences"
									[myProfile := (Profile retrieve: category, 'Block').
									building := visitor visitUrbanProfileForAppartmentBlock: myProfile.
									building area: areaOfInterest.
									nbCreatedBuildingsPerCategory at: category, 'Block' ifAbsentPut: 0.
									nbCreatedBuildingsPerCategory at: category, 'Block' 											put:(nbCreatedBuildingsPerCategory at: category, 'Block')+1.
									buildings "double dispatch and traversal logic in the visitor makes sense here"
									add: building.     ]]																																													
						ifFalse:
							[myProfile := Profile retrieve: category.
							building := visitor visitUrbanProfileForHouse: myProfile.
							building area: areaOfInterest.
							nbCreatedBuildingsPerCategory at: category ifAbsentPut: 0.
							nbCreatedBuildingsPerCategory at: category 
									put: (nbCreatedBuildingsPerCategory at: category) +1.
							buildings "double dispatch and traversal logic in the visitor makes sense here"
							add: building.]. 
						
				totalResidences := totalResidences +1.
			]]. 
	   "totResidencesPerCategory inspect."
		"visitor inspect."
		"buildings inspect."
		visitor buildings: buildings.
		"visitor residences inspect."
		residencesTypes := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).
		"(residencesTypes frequencies) inspect.
		(residencesTypes identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect."
		buildingsOrg := OrderedCollection new.
		cmp := OrderedDictionary new.
		residenceDistribution categories with: (residenceDistribution probabilities) do: 
			[ :c :p | cmp at: c put: ({p} asOrderedCollection) ].	
		(residencesTypes frequencies) keysAndValuesDo: 
			[ :k :v | | f tb mykey| 
				f := ((v/aNumber) asFloat rounded).
				((k = #HLMNew) or: (k = #HLMRenovated)) 
					ifTrue:
						[mykey := k ,'Block'.
						tb :=  buildings select: [:b | "self halt. "
										(b isKindOf: AppartmentBlock)
										and: 
										((visitor modelToScenarioDict at: b) first name = mykey )]."self halt."
										buildingsOrg addAll: (tb first: ((v/(12*aNumber)) asFloat rounded))]
					ifFalse: 
						[buildingsOrg addAll: 
							(( buildings select: 
										[:b | ((b isKindOf: House)
												and: 
												(((visitor modelToScenarioDict at: b) first) name = k))]) first: f)].
				(cmp at: k) add: f.
			].
		"buildingsOrg inspect."	
		visitor buildings: buildingsOrg.
		visitor residencesUpdate."self halt."
		residencesTypesOrg := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).	
		(residencesTypesOrg  identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect.
		mySum := cmp values inject: 0 into: [ :sum :e | sum + e at:2 ].
		cmp := cmp collect: [ :e | {(((e value at: 1)*100) asFloat round: 1) . (((e value at: 2)/mySum*100) asFloat round: 1)}].
		cmp inspect.
