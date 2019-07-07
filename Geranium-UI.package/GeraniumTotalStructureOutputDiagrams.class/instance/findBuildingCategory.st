accessing
findBuildingCategory

" This is temprary, should not used if the data structure is correct"

	|dict|
	dict := Dictionary newFromKeys: #(#HLMHousing #HLMNewBlock #HLMNew #HLMRenovatedBlock HLMRenovated #PrivateHousing #SocialHousing) andValues: #(1 2 2 3 3 4 5).
	^dict
		