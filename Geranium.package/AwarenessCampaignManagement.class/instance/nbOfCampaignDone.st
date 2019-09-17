accessing
nbOfCampaignDone

	nbOfCampaignDone isNil ifTrue: [ nbOfCampaignDone := 0 ].
	^nbOfCampaignDone