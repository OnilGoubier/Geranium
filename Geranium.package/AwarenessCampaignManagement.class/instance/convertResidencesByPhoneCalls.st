computing
convertResidencesByPhoneCalls

	awarenessPhoneCalls doWithIndex: 
		[ :apc :i| apc residences: (self residences at: (self nbOfCampaignDone + i)).
			self convertedResidences at: (self nbOfCampaignDone + i) put: apc convertResidencesCampaign.
			self residences at: (self nbOfCampaignDone + i +1) put: 
				( (self residences at: (self nbOfCampaignDone + i)) select: [:e | ((self convertedResidences at: (self nbOfCampaignDone + i)) includes: e) not ]).
			self awarenessPhoneCallCost add: apc totalCost.].
	self totalProbabilityByPhone: self allConvertedResidences size /(self residences at:1) size.
	nbOfCampaignDone := self nbOfCampaignDone + awarenessPhoneCalls size.
	



	