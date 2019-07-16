tests
nbResidencesPerCategoryExample

"
GRCategoricalDistributionScenarioExamples new nbResidencesPerCategoryExample
"

	| areaOfInterest totalResidences totalBuildings1 totalBuildings2 nbCreatedResidencesPerCategory nbCreatedBuildingsPerCategory buildings
	buildings1 buildings2 numberOfDeclaredResidences totalNumberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes nbOfResidenceInBuilding|

	self geraniumStakeholderMeetingTEST.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	"areaOfInterest := visitor analyze: scenario."
	areaOfInterest := AreaOfInterest new.
	areaOfInterest coordinates: scenario coordinates.
	"{ visitor . areaOfInterest } inspect."
	"self assert: areaOfInterest buildings size equals: 194."
	"residences := (areaOfInterest buildings select: [ :b | b class = House ]) size 
	+ ((areaOfInterest buildings select: [ :b | b class = AppartmentBlock ]) 
			collect: [:block | block appartments values size]) sum.
	self assert: residences > 500."
	
	numberOfDeclaredResidences := scenario nbResidencesPerCategory.
	resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	residenceDistribution := scenario urbanProfilesToPercentages. 
	"self halt."
	buildings1 := OrderedCollection new.
	buildings2 := OrderedCollection new.
	
	totalResidences := 0.
	totalNumberOfDeclaredResidences := numberOfDeclaredResidences values sum.
	nbOfResidenceInBuilding := 0.
	nbCreatedResidencesPerCategory := Dictionary new.
	nbCreatedBuildingsPerCategory := Dictionary new.
	
	[totalNumberOfDeclaredResidences
			ifNil: [ true ]
			ifNotNil: [ totalResidences < totalNumberOfDeclaredResidences ]]
			whileTrue: [ |building residence category myProfile|
						"The following code is the key, to create a building according to the probabilities for each category presented in residenceDistribution variable"
						residence := (visitor visitNode: 
									(resolvedResidenceProfiles at: (residenceDistribution next))).
						"self halt."
						category := ((visitor modelToScenarioDict at: residence) first) name.
						(nbCreatedResidencesPerCategory at:category) < (numberOfDeclaredResidences at: category)
								ifTrue: [  	
										(residence isKindOf: Appartement)
												ifTrue:[							
													nbCreatedResidencesPerCategory at:category 
																		put: (nbCreatedResidencesPerCategory at:category) +1.
													((nbCreatedResidencesPerCategory at:category) = 12)
															ifTrue: 
																[myProfile := (Profile retrieve: category, 'Block').
																building := visitor visitUrbanProfileForAppartmentBlock: myProfile.
																building area: areaOfInterest.
																nbCreatedBuildingsPerCategory at: category, 'Block' 
																				put: (nbCreatedBuildingsPerCategory at: category, 'Block') +1]]
												ifFalse:[
														myProfile := Profile retrieve: category.
														building := visitor visitUrbanProfileForHouse: myProfile.
														building area: areaOfInterest.
														nbCreatedBuildingsPerCategory at: category 
																				put: (nbCreatedBuildingsPerCategory at: category) +1.
								]. 
						buildings "double dispatch and traversal logic in the visitor makes sense here"
						add: building.
						totalResidences := totalResidences +1.
			]]. 
		visitor inspect.
		"buildings inspect."
		visitor buildings: buildings.
		"visitor residences inspect."
		residencesTypes := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).
		(residencesTypes frequencies) inspect.
		(residencesTypes identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect.