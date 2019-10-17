scripts
geraniumStakeholderMeeting

	StatisticalScenario new 
		named: #Geranium;
		coordinates: (46.16352961038194 @ -1.1302614212036133) 
		-> (46.166851083597415 @ -1.1267745494842527);
		totalNumberOfBuildings: 56; 
		totalNumberOfResidences: 186; 
		nbResidencesForEachCategory:({  
			#HLMRenovated.
			#HLMNew.
			#HLMHousing.
			#SocialHousing.
			#PrivateHousing
		} nb: { 108 . 48 . 13 . 11 . 19 });
		climateProfile: #LaRochelleAverage;
		trendsProfile: #RegionalConsumptionTrends;
		weightsProfile: #ExceedingDPEHypothesis;
		awarenessTelephoneCostProfile: #AwarenessByPhoneCostEstimation;
		awarenessConcertationCostProfile: #AwarenessByConcertationCostEstimation;
		seed: 23424080;
		years: 1.		
		
	UrbanProfileForAppartmentBlock new
		named: #HLMRenovatedBlock;
		dimensions: (2 floors: 2 corridors: 3 appts);
		appartmentPercentages: {  
			#HLMRenovated.
		} % { 100.0 }.
		
	UrbanProfileForAppartmentBlock new
		named: #HLMNewBlock;
		dimensions: (2 floors: 2 corridors: 3 appts);
		appartmentPercentages: {  
			#HLMNew.
		} % { 100.0 }.
				
	UrbanProfileForAppartment new 
		named: #HLMRenovated;
		category: DPEB;
		surface: [50->115];
		occupantClass: {SingleAdult . Couple . SingleParent. Family} % {12.5 . 19.0 . 31.0 . 37.5}; 
		numberOfChildren: [1 -> 4]; 
		income: [(1150.0*12) -> (4000.0*12)];
		transportMode: {Bicycle . Car . OnFoot } % { 14 . 71 . 15}; "public transport, other, onfoot are put together on OnFoot"
		consumptionChoice: {EnvironmentFriendly . EmphasizeQuality  . EmphasizePrice} % { 47 . 13 . 40 };
		peakOffPeakHours: {PeakOffPeakHoursAware . PeakOffPeakHoursUnaware . PeakOffPeakHoursDoNotKnow } % { 30 . 45 . 25};
		ownership: false % 100.
		
	UrbanProfileForAppartment new 
		named: #HLMNew;
		category: DPEA;
		surface: [48->98];
		occupantClass: {SingleAdult . Couple . SingleParent . Family} % {42.10 . 11.06 . 31.0 . 15.84};
		numberOfChildren: [1 -> 3]; 
		income: [(1150.0*12) -> (3000.0*12)];
		transportMode: {Bicycle . Car . OnFoot} % {14 . 71 . 15 };
		consumptionChoice: {EnvironmentFriendly . EmphasizeQuality  . EmphasizePrice} % { 47 . 12 . 41 };
		peakOffPeakHours: { PeakOffPeakHoursAware . PeakOffPeakHoursUnaware . PeakOffPeakHoursDoNotKnow} % { 30 . 45 . 25};
		ownership: false % 100.
		
	UrbanProfileForHouse new 
		named: #HLMHousing;
		category: DPEA;
		surface: [47.0 -> 92.0];
		exposure:  [4->5]; 
		occupantClass: {SingleAdult . Couple . SingleParent . Family} % {18.18. 27.27 . 31.0 . 23.55}; 
		numberOfChildren: [1 -> 4]; 
		income: [(1150.0*12) -> (3000.0*12)];
		transportMode: {Bicycle . Car . OnFoot } % { 11 . 74 . 15 };
		consumptionChoice: {EnvironmentFriendly . EmphasizeQuality  . EmphasizePrice} % { 42 . 12 . 46 };
		peakOffPeakHours: { PeakOffPeakHoursAware . PeakOffPeakHoursUnaware . PeakOffPeakHoursDoNotKnow} % { 28 . 44 . 28};
		ownership: false % 100.
	
	UrbanProfileForHouse new 
		named: #SocialHousing;
		category: {DPED . DPEE} % {60.0 . 40.0};
		surface: [60.0 -> 87.0];
		exposure: [4 -> 5]; 
		occupantClass: {SingleAdult . Couple . SingleParent . Family} % {44.44 . 0.0 . 31.0 . 24.56}; 
		numberOfChildren: [1 -> 2]; 
		income: [(1150.0*12) -> (3000.0*12)];
		transportMode: {Bicycle . Car . OnFoot } % {14 . 71 . 15};
		consumptionChoice: {EnvironmentFriendly . EmphasizeQuality  . EmphasizePrice} % {48 . 12 . 40  };
		peakOffPeakHours: {PeakOffPeakHoursAware . PeakOffPeakHoursUnaware  . PeakOffPeakHoursDoNotKnow} % { 31 . 44 . 26};
		ownership: true % 100.
	
	UrbanProfileForHouse new 
		named: #PrivateHousing;
		category: {DPED . DPEE} % {60.0 . 40.0};
		surface: [80.0 -> 160.0];
		exposure: [4 -> 5]; 
		occupantClass: {SingleAdult . Couple . SingleParent . Family} % {18.75. 12.50 . 31.0 . 37.75}; 
		numberOfChildren: [1 -> 2]; 
		income: [(1150.0*12) -> (4000.0*12)];
		transportMode: {Bicycle . Car . OnFoot} % {21 . 63 . 16};
		consumptionChoice: {EnvironmentFriendly . EmphasizeQuality  . EmphasizePrice } % { 62 . 12 . 25 };
		peakOffPeakHours: {PeakOffPeakHoursAware . PeakOffPeakHoursUnaware . PeakOffPeakHoursDoNotKnow} % {35 . 50 . 15};
		ownership: true % 100.	
	
	ClimateProfile new "4 Season"
		named: #LaRochelleAverage; 
		medianTemperature: (13.25 ~ 1.5) | [0 -> 32]; 
		seasonalTemperatureVariation: 2.0;
		medianHumidity: (81.16 ~ 4.05) | [0 -> 100];
		seasonalHumidityVariation: 2. 
		
	TrendsProfile new 
		named: #RegionalConsumptionTrends;
		seasonal: { 
			#Winter -> 0.1. 
			#Spring -> 1. 
			#Fall -> -1. 
			#Summer -> 0.1.
		};	daily: {  
			#Monday -> 0.7.
			#Tuesday -> 0.7.
			#Wednesday -> 0.8.
			#Thursday -> 0.7.
			#Friday -> 0.8.
			#Saturday -> 1.
			#Sunday -> 1.
		}; hourly: { 
			#Night -> {-0.4 . -0.4 . -0.4 . -0.4 . -0.4 . -0.4 . -0.4}.
			#Morning -> { 0.6 . 0.6 . 0.6 . 0.0 . 0.0 . 0.0 }.
			#Afternoon -> { 0.0 . 0.0 . 0.0 . 0.0 . 0.0 }.
			#Evening -> { 1 . 1 . 1 . 1 . 1 . 0.0 }
		}.
	
	
	WeightsProfile new "Explorative Model: Education/Building Hypothesis"
		named: #ExceedingDPEHypothesis;
		temperature: [ -0.5 -> 0.5 ];  "30%"
	   	humidity: [ -0.15 ->  0.15 ]; "15%"
	   	exposure: [ -0.05 -> 0.05 ];  "5%"
		
		occupants: [ -0.10 -> 0.10 ]; "10%"
		income: [ -0.05 -> 0.05  ]; "5%"
		awareness: [ -0.3 -> 0.3 ]; "5%"
		ownership: [ -0.05 -> 0.05 ]; "5%"

		day: [ -0.10 -> 0.10 ];  "10%"
		hour: [ -0.10 -> 0.10 ]; "10%"
		season: [ -0.05 -> 0.05 ].	"5%"
						
	AwarenessTelephoneCostProfile new "Cost to improve people awareness using phone calls"
		named: #AwarenessByPhoneCostEstimation;
		costPerResidence: (11.0 ~ 2); "in € per residence"
		duration: [ 1 -> 3 ]; "duration in months"
		nbOfTimes: 4 "number of time to call a residence".
		
	AwarenessConcertationCostProfile new "Cost to improve people awareness using workshops, meetings, coferences, ..."
		named: #AwarenessByConcertationCostEstimation;
		duration: [ 24 -> 36 ]; "duration in months"
		nbOfTimes: 4; "number of concertations"
		averageCostOfMeetings: (150.0 ~ 25.0);
		nbOfMeetings: [1 -> 2];
		averageCostOfCouncilMeetings: (225.0 ~ 25.0);
		nbOfCouncilMeetings: [1 -> 2];
		averageCostOfForums: (300.0 ~ 30.00);
		nbOfForums: [ 1 -> 3 ];
		averageCostOfStudies: (150.0 ~ 25);
		nbOfStudies: [ 1 -> 2 ];
		averageCostOfSurveys: (150.0 ~ 15);
		nbOfSurveys: [ 2 -> 3 ];
		averageCostOfWorkshops: (300 ~ 30);
		nbOfWorkshops: [6 -> 10];
		nbOfParticipants: [40 -> 60];
		contractCost: (150.0 ~ 25).
	