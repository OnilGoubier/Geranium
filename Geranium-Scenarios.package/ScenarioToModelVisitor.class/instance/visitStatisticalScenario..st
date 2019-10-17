visiting
visitStatisticalScenario: aStatisticalScenario

	|totalResidences totalPopulation totalNumberOfDeclaredResidences aNumber nbCreatedResidencesPerCategory nbCreatedBuildingsPerCategory buildingsOrg |

	aNumber := 100. " this is to improve precesion of the algorithm, better from DSL?"
	areaOfInterest := AreaOfInterest new.
	areaOfInterest coordinates: aStatisticalScenario coordinates.
	numberOfDeclaredResidences := (aStatisticalScenario nbResidencesPerCategory) collect: [:e | e * aNumber].
	numberOfDeclaredPopulation := aStatisticalScenario resolvePopulation.
	residenceDistribution := aStatisticalScenario urbanProfilesToPercentages.
	resolvedResidenceProfiles := aStatisticalScenario resolveUrbanProfiles.
	climateProfile := aStatisticalScenario resolveClimateProfile.
	trendsProfile := aStatisticalScenario resolveTrendsProfile.
	weightsProfile := aStatisticalScenario resolveWeightsProfile.
	awarenessTelephoneCostProfile := aStatisticalScenario resolveAwarenessTelephoneProfile.
	awarenessConcertationCostProfile := aStatisticalScenario resolveAwarenessConcertationProfile.
	years := aStatisticalScenario years next.
	
	buildings := OrderedCollection new.
	
	totalResidences := 0.
	totalPopulation := 0.
	totalNumberOfDeclaredResidences := numberOfDeclaredResidences values sum.
	nbCreatedResidencesPerCategory := Dictionary new.
	nbCreatedBuildingsPerCategory := Dictionary new.
	
	[totalNumberOfDeclaredResidences
		ifNil: [ true ]
		ifNotNil: [ totalResidences < totalNumberOfDeclaredResidences ]]
		whileTrue: 
			[ |building residence category myProfile|
		"The following code is the key, to create a building according to the probabilities for each category presented in residenceDistribution variable"
			residence := (self visitNode: 
							(resolvedResidenceProfiles at: (residenceDistribution next))).
			category := ((self modelToScenarioDict at: residence) first) name.
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
									building := self visitUrbanProfileForAppartmentBlock: myProfile.
									building area: areaOfInterest.
									nbCreatedBuildingsPerCategory at: category, 'Block' ifAbsentPut: 0.
									nbCreatedBuildingsPerCategory at: category, 'Block' 	put:(nbCreatedBuildingsPerCategory at: category, 'Block')+1.
									buildings "double dispatch and traversal logic in the visitor makes sense here"
									add: building.     ]]																																													
						ifFalse:
							[myProfile := Profile retrieve: category.
							building := self visitUrbanProfileForHouse: myProfile.
							building area: areaOfInterest.
							nbCreatedBuildingsPerCategory at: category ifAbsentPut: 0.
							nbCreatedBuildingsPerCategory at: category 
									put: (nbCreatedBuildingsPerCategory at: category) +1.
							buildings "double dispatch and traversal logic in the visitor makes sense here"
							add: building.]. 
						
				totalResidences := totalResidences +1.
				totalPopulation := totalPopulation + residence occupantSize.
			]]. 	
	
	
	buildingsOrg := self computeAllBuildingsFor: aNumber.
	areaOfInterest buildings: buildingsOrg.
	self buildings: buildingsOrg. 
	self residencesUpdate.
	self associate: climateProfile with: (climate := (self visitNode: climateProfile)).
	areaOfInterest climateData: climate.
	self 
		associate: trendsProfile 
		with: (perfecture := (self visitNode: trendsProfile)). "country also will be created
	here with the profiles"
	areaOfInterest prefecture: perfecture. 
	areaOfInterest prefecture country weightsProfile: weightsProfile deepCopy.
	self associate: weightsProfile with: (self visitNode: weightsProfile).
	self associate: aStatisticalScenario with: areaOfInterest.
	awarenessTelephoneCostProfile successProbabilities.
	awarenessByPhone :=  (self visitAwarenessTelephoneCostProfile: awarenessTelephoneCostProfile).
	awarenessConcertationCostProfile successProbabilities.
	awarenessByConcertation := (self visitAwarenessConcertationCostProfile: awarenessConcertationCostProfile).
	self createAndDoAwarenesCampaign.
	
	^ areaOfInterest