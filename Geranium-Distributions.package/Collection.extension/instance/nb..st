*Geranium-Distributions
nb: anotherCollection

	|dict oc|
	
	dict := Dictionary new.
	oc := self asOrderedCollection.
	oc with: anotherCollection do: [ :c :n | dict at: c put: n ].
	^ dict
	"^ GRCategoricalDistribution new 
		categories: self;
		probabilities: (anotherCollection collect: [ :p | p / (anotherCollection sum) ])"