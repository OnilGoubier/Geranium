accessing
awareness

	"awareness is computed based on:
	1. transportMode: mode of transport probabilities
	2. consumptionChoice: probabilities to choose an environmentally friendly product, or emphazize quality or price
	3. peakOffPeakHours: knowing of pek and off peak hours
	We use weight for a choice representing its correlation to awareness.
	
	"
	
	| pAware maxAw aws |
	
	aws := Array new: 3.
	awareness isNil ifTrue: [
			"self halt."
		1 to:	aws size do:  
			[:i|  aws at: i put: 
			(((transportMode categories at: i) weight * 
			(transportMode categories at: i) correction * 
			(transportMode probabilities at:i)) +
			 ((consumptionChoice categories at:i) weight * 
			(consumptionChoice categories at:i) correction * 
			(consumptionChoice probabilities at:i)) + 
			 ((peakOffPeakHours categories  at: i) weight * 
			(peakOffPeakHours categories  at: i) correction * 
			(peakOffPeakHours probabilities at: i)))
			 ].
			
			aws do: [ :e | e asString logCr ].
			maxAw := aws max.
			(maxAw = (aws at: 1)) ifTrue: [ pAware := ((aws at: 1) + (aws at: 2))/ aws sum]	
								ifFalse: [ pAware := (aws at: 1)/ aws sum].		
	
			awareness := GRCategoricalDistribution new.
			awareness categories: { ConsumptionAware . ConsumptionUnaware}.
			awareness probabilities: { pAware . 1-pAware }].
	
	^ awareness