accessing
next_saved

	|categoriesToSample|
	categoriesToSample := OrderedCollection new.
	"self halt."
	self booleanDistributionOfProbabilities
		withIndexDo: [ :bd :i | 
				bd next ifTrue: [ categoriesToSample add: (categories at: i) ]
		].
	^ categoriesToSample 
			ifEmpty: [ self next ] 
			ifNotEmpty: [ categoriesToSample at: (self aRandomSamplingIndexFrom: 1 to: categoriesToSample size) ]