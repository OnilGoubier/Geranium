examples
geranium

	StatisticalScenario new 
		named: #ScenarioA;
		coordinates: (46.16352961038194 @ -1.1302614212036133) 
		-> (46.166851083597415 @ -1.1267745494842527);
		totalNumberOfBuildings: 20; "#determinedByMap;"
		residencePercentages:{  
			#AppartmentBlockTypeA.
			#AppartmentBlockTypeB.
			#HouseTypeA
		} % { 0.3 . 0.2 . 0.5 }; 
		climateProfile: #UrbanClimateA;
		trendsProfile: #FrenchConsumptionTrends;
		weightsProfile: #UrbanHypothesisA;
		years: 1.
		
		
	UrbanProfileForAppartmentBlock new
		named: #AppartmentBlockTypeA;
		dimensions: (2 x: 1 x: 2);
		appartmentPercentages: {  
			#AppartmentTypeA.
			#AppartmentTypeB.
		} % { 0.2 . 0.8 }.
		
	UrbanProfileForAppartmentBlock new
		named: #AppartmentBlockTypeB;
		dimensions: (2 x: 1 x: 3);
		appartmentPercentages: {  
			#AppartmentTypeA.
			#AppartmentTypeB.
		} % { 0.5 . 0.5 }.
		
	UrbanProfileForAppartment new 
		named: #AppartmentTypeA;
		category: DPEA;
		surface: [50.0 -> 80.0];
		occupantClass: {SingleAdult . Couple . Family} % {0.60 . 0.30. 0.10};
		numberOfChildren: [1 -> 3]; "valid only for family"
		income: (72000.0 ~ 10000) | [36000.0 -> 100000];
		awareness: {ConsumptionAware . ConsumptionUnaware} % {0.40 . 0.60};
		ownership: true % 20.
	
	UrbanProfileForAppartment new 
		named: #AppartmentTypeB;
		category: DPEB;
		surface: [80.0 -> 110];
		occupantClass: {Family . Couple} % {0.50 . 0.40};
		numberOfChildren: [1 -> 3]; "valid only for family"
		income: (92000.0 ~ 15000) | [66000.0 -> 180000];
		awareness: {ConsumptionAware . ConsumptionUnaware} % {0.10 . 0.90};
		ownership: true % 10.
		
	UrbanProfileForHouse new 
		named: #HouseTypeA;
		category: DPEC;
		surface: [90.0 -> 130.0];
		exposure: (5 ~ 1) | [0 -> 5]; 
		occupantClass: Family; 
		numberOfChildren: [1 -> 3]; "valid only for family"
		income: (72000.0 ~ 10000) | [36000.0 -> 80000];
		awareness: {ConsumptionAware . ConsumptionUnaware} % {0.15 . 0.85};
		ownership: true % 60.
		
	ClimateProfile new 
		named: #UrbanClimateA; 
		medianTemperature: (20.0 ~ 1.5) | [0 -> 32]; 
		seasonalTemperatureVariation: 3;
		medianHumidity: [ 40.0 ~> 100.0 ];
		seasonalHumidityVariation: 2. 
		
	TrendsProfile new
		named: #FrenchConsumptionTrends;
		seasonal: { 
			#Winter -> 1. 
			#Spring -> -0.2. 
			#Fall -> -0.1. 
			#Summer -> 1
		};	daily: {  
			#Monday -> 0.8.
			#Tuesday -> 0.8.
			#Wednesday -> 0.8.
			#Thursday -> 0.8.
			#Friday -> 0.9.
			#Saturday -> 1.
			#Sunday -> 1.
		}; hourly: {  
			#Midnight -> { -1 . -1 . -1 . -1 . -1 . -1 . -0.5 }.
			#Morning -> { 1 . 1 . 1 . 0.5 . 0.5 . 1 }.
			#Afternoon -> { 0.5 . 0.5 . 0.5 . 0.5 . 0.5 }.
			#Night -> { 1 . 1 . 1 . 1 . 1 . 1 }
		}.
		
	WeightsProfile new
		named: #UrbanHypothesisA;
		season: [ -0.1 -> 0.1 ];
		day: [ -0.01 -> 0.01 ];
		hour: [ -0.1 -> 0.1 ];
		exposure: [ -0.1 -> 0.1 ]; 
		occupants: [ 0 -> 0.05 ]; 
		income: [ -0.05 -> 0.05  ]; 
		ownership: [ -0.05 -> 0.05 ]; 
		awareness: [ -0.1 -> 0.1 ]; 
		temperature: [ -0.4 -> 0.4 ]; 
		humidity: [ -0.09 ->  0.04 ]. 