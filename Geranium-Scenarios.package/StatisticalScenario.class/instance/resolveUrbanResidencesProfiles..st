accessing
resolveUrbanResidencesProfiles: aGRCategoricalDistribution
	
	|resolvedDict|
	resolvedDict := Dictionary new.
	aGRCategoricalDistribution  categories do: [ :c | 
		 resolvedDict at: c put: (Profile retrieve: c).
	].
	^ resolvedDict