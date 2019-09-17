computing
convertResidencesByConcertations

	awarenessConcertations doWithIndex: 
		[ :apc :i| "self halt." apc campaignMng: self.
			apc residences: (self residences at: (nbOfCampaignDone + i)).
			self convertedResidences at: (nbOfCampaignDone + i) put: apc convertResidencesCampaign.
			self residences at: (self nbOfCampaignDone + i +1) put: 
				( (self residences at: (self nbOfCampaignDone + i)) select: [:e | ((self convertedResidences at: (self nbOfCampaignDone + i)) includes: e) not ]).
			self awarenessConcertationCost add: apc totalCost.
			].
	nbOfCampaignDone := nbOfCampaignDone +awarenessConcertations size.
	



	