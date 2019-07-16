tests
nbResPerCategoryExampleBy: aNumber

"
GRCategoricalDistributionScenarioExamples new residencesNbOfResExampleBy: 1
"

	| areaOfInterest totalBuildings finalCreatedBuildings totalResidences nbOfResidenceInBuilding
	buildings numberOfDeclaredBuildings numberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes cmp catBuildingMultipDict catBuildingDict totalCreatedBuildings buildingProfilesPercentages residenceProfilesPercentages|

	self fullGeraniumTestScript: aNumber.
	scenario := Scenario retrieve: #GeraniumTest.
	buildingProfilesPercentages := scenario urbanProfilesToPercentages. " aGRCategoricalDistribution on building categories"
	"Should we create aCategoricalDistribution for residences categories ? "
	residenceProfilesPercentages := scenario urbanBuildingToResidencesProfiles.
	"self halt."
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	
	numberOfDeclaredBuildings := scenario resolveBuildings.
	numberOfDeclaredResidences := scenario resolveResidences.
	"resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	residenceDistribution := scenario urbanProfilesToPercentages."
	resolvedResidenceProfiles := scenario resolveUrbanResidencesProfiles: residenceProfilesPercentages .
	residenceDistribution := residenceProfilesPercentages. 
	"self halt."
	buildings := OrderedCollection new.
	
	totalBuildings := 0.
	totalResidences := 0.
	nbOfResidenceInBuilding := 0.
	
	[numberOfDeclaredResidences 
			ifNil: [ true ]
			ifNotNil: [ totalResidences   < numberOfDeclaredResidences  ]]
			whileTrue: 
				[ |building residence category myProfile|
						"The following code is the key, to create a building according to the probabilities for each category presented in residenceDistribution variable"
						residence := (visitor visitNode: 
									(resolvedResidenceProfiles at: (residenceDistribution next))).
						"self halt."
						category := ((visitor modelToScenarioDict at: residence) first) name.	
						(residence isKindOf: Appartement)
							ifTrue:[
								nbOfResidenceInBuilding := nbOfResidenceInBuilding +1.
								(nbOfResidenceInBuilding = 12)
									ifTrue: 
										[myProfile := (Profile retrieve: category, 'Block').
										building := visitor visitUrbanProfileForAppartmentBlock: myProfile].
										totalBuildings  := totalBuildings  + 1]
							ifFalse:[
								myProfile := Profile retrieve: category.
								building := visitor visitUrbanProfileForHouse: myProfile.
								buildings "double dispatch and traversal logic in the visitor makes sense here"
								add: building.
								building area: areaOfInterest.
								totalBuildings  := totalBuildings  + 1]. 
						totalResidences := totalResidences +1.		
						].
		visitor buildings: buildings.
		catBuildingMultipDict := Dictionary new.
		buildings do: [ :e | | k | k := ((visitor modelToScenarioDict at: e) first) name.
									 catBuildingMultipDict at: k 
											ifPresent:  [  (catBuildingMultipDict at: k) add: e] 
											ifAbsentPut: [{e} asOrderedCollection]].
											"self halt."
		totalCreatedBuildings := 0.
		cmp := Dictionary new.
		residenceDistribution categories with: (residenceDistribution probabilities) do: 
			[ :c :p | cmp at: c put: ({(p*100) round: 1} asOrderedCollection) ].
		catBuildingDict := catBuildingMultipDict collect: 
											[ :e | e first: ((e size)/aNumber) asFloat rounded].
		catBuildingDict values do: [ :e | totalCreatedBuildings := totalCreatedBuildings + e size ].
										
		cmp keysAndValuesDo: [ :k :v | v add: (((((catBuildingDict at: k) size)/totalCreatedBuildings)*100) asFloat round: 1 )].
	
		finalCreatedBuildings	:= OrderedCollection new.
		catBuildingDict valuesDo: [ :v | finalCreatedBuildings addAll: v ].
		visitor buildings:  finalCreatedBuildings.
		visitor residencesUpdate.
		"self halt."
		residencesTypes := (visitor residences collect: [ :r | ((visitor modelToScenarioDict at: r) first) name ]).	
		(residencesTypes  identityHistogramWithCenteredLabelWithColor: self categoriesColors) inspect.
		cmp inspect.