accessing
urbanBuildingToResidencesProfiles

" Not used currently"
	
	|residencesProfiles|
	residencesProfiles := GRCategoricalDistribution new.
	residencesProfiles categories: 
		(urbanProfilesToPercentages categories collect: 
			[ :c | self transformBlockToResidence: c]).
	residencesProfiles probabilities: urbanProfilesToPercentages probabilities.
	^ residencesProfiles