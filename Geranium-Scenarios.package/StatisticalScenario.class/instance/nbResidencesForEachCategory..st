as yet unclassified
nbResidencesForEachCategory: aDictionary

	| dist |

	dist := GRCategoricalDistribution new 
	categories: aDictionary keys;
	probabilities: (aDictionary values collect: [ :p | (p / (aDictionary values sum)) asFloat ]).
	urbanProfilesToPercentages := self distributionOf: dist.
	nbResidencesForEahCategory := aDictionary