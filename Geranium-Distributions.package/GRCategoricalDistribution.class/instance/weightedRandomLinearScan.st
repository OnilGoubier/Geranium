accessing
weightedRandomLinearScan

	|remainingDistance|
	
	remainingDistance  := self randomSamplingGenerator next.
	categories with: probabilities do: 
		[ :c :p | remainingDistance := remainingDistance - p.
					remainingDistance  < 0 ifTrue: [^c]]