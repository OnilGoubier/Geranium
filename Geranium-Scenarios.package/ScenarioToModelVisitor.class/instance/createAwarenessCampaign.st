initialization
createAwarenessCampaign

	|size|
	
	size := (awarenessByPhone size + awarenessByConcertation size + 1).
	awarenessCampaign := AwarenessCampaignManagement new.
	awarenessCampaign residences: (Array new: size).
	awarenessCampaign residences at: 1 put: self residences.
	awarenessCampaign awarenessPhoneCalls: awarenessByPhone.
	awarenessCampaign awarenessConcertations: awarenessByConcertation.
	awarenessCampaign convertedResidences: (Array new: size).