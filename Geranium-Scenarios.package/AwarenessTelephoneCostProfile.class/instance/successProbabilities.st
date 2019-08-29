computing
successProbabilities

" successProbabilitiesis a GRCategoricalDistribution, with probabilities computed 
 in the method sucessProbabilityFor: 
"
	|p|

	successProbabilities := GRCategoricalDistribution new.
	successProbabilities categories: {Successful . Unsuccessful}.
	p := self successProbabilityFor: 0.
	successProbabilities probabilities: { p . 1 - p }.
	^ successProbabilities 