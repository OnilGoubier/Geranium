*Geranium-Distributions
typeFrequenciesAsColorDistributionWithColors: aDictionary
	
	|f sum|
	f := self frequencies.
	sum := f values sum.
	^ (f keys collect: [ :k | (aDictionary at: k asSymbol) "alpha: 0.5"]) 
	% (f values collect: [ :v | (v / sum) * 100.0  ])