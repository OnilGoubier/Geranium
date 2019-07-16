tests
setUp
	"to test categorical distribution"

	aGRCategoricalDistribution := ({ #x . #y . #z } % { 10 . 20 . 70 }).
	frequencies := aGRCategoricalDistribution frequencies.