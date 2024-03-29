tests
nbResidencesPerCategoryExample

"
GRCategoricalDistributionScenarioExamples new nbResidencesPerCategoryExample
"

	| areaOfInterest totalResidences nbCreatedResidencesPerCategory totResidencesPerCategory nbCreatedBuildingsPerCategory buildings
	numberOfDeclaredResidences totalNumberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes nbOfResidenceInBuilding|

	self geraniumStakeholderMeetingTEST.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := AreaOfInterest new.
	areaOfInterest coordinates: scenario coordinates.
	numberOfDeclaredResidences := scenario nbResidencesPerCategory.
	numberOfDeclaredResidences inspect.
	resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	resolvedResidenceProfiles inspect.
	residenceDistribution := scenario urbanProfilesToPercentages.
	residenceDistribution inspect. 
	"self halt."
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
									buildings add: building.     ]]																																													
						ifFalse:
							[myProfile := Profile retrieve: category.
							building := visitor visitUrbanProfileForHouse: myProfile.
							building area: areaOfInterest.
							nbCreatedBuildingsPerCategory at: category ifAbsentPut: 0.
							nbCreatedBuildingsPerCategory at: category 
									put: (nbCreatedBuildingsPerCategory at: category) +1.
							buildings add: building.]. 
						
				totalResidences := totalResidences +1.
			]]. 
	   totResidencesPerCategory inspect.
		"visitor inspect."
		"buildings inspect."
		visitor buildings: buildings.
		"visitor residences inspect."
		residencesTypes := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).
		(residencesTypes frequencies) inspect.
		(residencesTypes identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect.