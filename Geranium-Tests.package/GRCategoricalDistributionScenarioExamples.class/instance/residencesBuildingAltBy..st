tests
residencesBuildingAltBy: aNumber

"
GRCategoricalDistributionScenarioExamples new residencesBuildingAltBy: 500
"

	| areaOfInterest totalBuildings finalCreatedBuildings
	buildings numberOfDeclaredBuildings numberOfDeclaredResidences resolvedResidenceProfiles
	residenceDistribution residencesTypes cmp catBuildingMultipDict catBuildingDict totalCreatedBuildings|

	self fullGeraniumTestScript: aNumber.
	scenario := Scenario retrieve: #GeraniumTest.
	visitor := ScenarioToModelVisitor new.
	areaOfInterest := visitor analyze: scenario.
	numberOfDeclaredBuildings := scenario resolveBuildings.
	numberOfDeclaredResidences := scenario resolveResidences.
	resolvedResidenceProfiles := scenario resolveUrbanProfiles.
	residenceDistribution := scenario urbanProfilesToPercentages. 
	buildings := OrderedCollection new.
	
	totalBuildings := 0.
	
	[numberOfDeclaredBuildings 
			ifNil: [ true ]
			ifNotNil: [ totalBuildings  < numberOfDeclaredBuildings ]]
			whileTrue: 
				[ |building|
						building := (visitor visitNode: 
									(resolvedResidenceProfiles at: (residenceDistribution next))).			
						buildings "double dispatch and traversal logic in the visitor makes sense here"
						add: building.
						building area: areaOfInterest.
						totalBuildings  := totalBuildings  + 1].
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