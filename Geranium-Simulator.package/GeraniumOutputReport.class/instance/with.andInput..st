instance creation
with: anAreaOfInterest andInput: visitor

	"|residencesTypesDPE residencesTypesDPERes|"
	inputVisitor := visitor.
	areaOfInterest := anAreaOfInterest.
	categories := (areaOfInterest residences collect: [ :r | r category ]) asSet.
	totalSurface := (areaOfInterest residences collect: [ :r | r surface ]) sum.
	minAvgExpectedConsumptionPerYear := (categories collect: [ :c | c yearlyInterval key ]) min * totalSurface.
	maxAvgExpectedConsumptionPerYear := (categories collect: [ :c | c yearlyInterval value ]) max * totalSurface.
	"self halt."
	consumptionHistory := areaOfInterest historyOf: #consumption.
	consumptionHistoryOfBuildings := Dictionary new.
	areaOfInterest buildings do: [ :b | consumptionHistoryOfBuildings at: b put: (b historyOf: #consumption) ].
	"residencesTypesConsumption := Dictionary new.
	areaOfInterest residences do: [ :r | |scEntity|
		scEntity := (self scenarioEntityOf: r) name.
		(residencesTypesConsumption keys includes: scEntity)
			ifTrue: [ residencesTypesConsumption at: scEntity put: ((residencesTypesConsumption at: scEntity) + (r historyOf: #consumption)) ]
			ifFalse: [ residencesTypesConsumption at: scEntity put: (r historyOf: #consumption) ] 
	]."
"
residencesTypesDPE := Dictionary new.
	areaOfInterest residences do: [ :r | |scEntity|
		scEntity := (self scenarioEntityOf: r) name.
		residencesTypesDPE at: scEntity ifPresent: [(residencesTypesDPE at: scEntity) add: r category]  ifAbsentPut: [{ r category } asOrderedCollection].
	]. 
residencesTypesDPERes := Dictionary new.
	residencesTypesDPE keysAndValuesDo: [:k :v | residencesTypesDPERes at: k put: v frequencies]."
	"residencesTypesDPERes inspect."
	avgConsumptionPerYear := consumptionHistory sum.
	self calculateConsumptionPerBuildingProfile.
	Transcript
		show: categories; cr;
		show: minAvgExpectedConsumptionPerYear; cr;
		show: maxAvgExpectedConsumptionPerYear; cr;
		show: avgConsumptionPerYear; cr