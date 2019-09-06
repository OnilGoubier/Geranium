accessing
awarenessSaved5Sept2019


	"awareness is computed based on:
	1. transportMode: mode of transport probabilities
	2. consumptionChoice: probabilities to choose an environmentally friendly product
	3. peakOffPeakHours: knowing of pek and off peak hours
	We use weight for a choice representing its correlation to awareness.
	To make it easy, currently we use 1 or 0 for weight.
	"
	
	|tpModeAw csChoiceAw pOPeakHoursAw pAware|
	
	tpModeAw := 0.
	csChoiceAw := 0.
	pOPeakHoursAw := 0.
	awareness isNil ifTrue: [
			"self halt."  
			transportMode categories with: transportMode probabilities do: 
						[:c :p | tpModeAw := (tpModeAw + (c weight * p))].
			consumptionChoice categories with: consumptionChoice probabilities do: 
						[:c :p | csChoiceAw := (csChoiceAw + (c weight * p))].
			peakOffPeakHours categories with: peakOffPeakHours probabilities do: 
						[:c :p | pOPeakHoursAw := (pOPeakHoursAw + (c weight * p))].
			 ('tpModeAw: ', tpModeAw asString)  logCr.
			('csChoiceAw: ' , csChoiceAw asString) logCr.
			('pOPeakHoursAw: ' , pOPeakHoursAw asString) logCr.
			pAware := (tpModeAw + csChoiceAw + pOPeakHoursAw)/3.
	
			awareness := GRCategoricalDistribution new.
			awareness categories: { ConsumptionAware . ConsumptionUnaware}.
			awareness probabilities: { pAware . 1 - pAware }].
	
	^ awareness