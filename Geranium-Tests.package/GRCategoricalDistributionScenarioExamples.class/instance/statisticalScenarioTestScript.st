as yet unclassified
statisticalScenarioTestScript

	StatisticalScenario new 
		named: #GeraniumTest;
		coordinates: (46.16352961038194 @ -1.1302614212036133) 
		-> (46.166851083597415 @ -1.1267745494842527);
		totalNumberOfBuildings: 56; 
		totalNumberOfResidences: 186; 
		residencePercentages:{  
			#HLMRenovatedBlock.
			#HLMNewBlock.
			#HLMHousing.
			#SocialHousing.
			#PrivateHousing
		} % { 15.24 . 6.51 . 23.91 . 19.56 . 34.78 }; 
		climateProfile: #LaRochelleAverage;
		trendsProfile: #RegionalConsumptionTrends;
		weightsProfile: #ExceedingDPEHypothesis;
		seed: 23424080;
		years: 1.		