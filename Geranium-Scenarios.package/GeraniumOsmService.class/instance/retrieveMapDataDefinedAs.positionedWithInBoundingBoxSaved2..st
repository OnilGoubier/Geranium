examples
retrieveMapDataDefinedAs: overpassDataTypeAndParamPairsStrings positionedWithInBoundingBoxSaved2: positionBoxSouthWestNorthEastAsString
	
	| s z|
	
	"you can consider serializing here and generally caching to avoid suprises with connection errors"
	
	s := WriteStream on: String new.
	s nextPutAll: '[out:json][timeout:25];('.
	overpassDataTypeAndParamPairsStrings 
		do: [ :p | 
			s nextPutAll: p; 
				nextPut: $(; 
				nextPutAll: positionBoxSouthWestNorthEastAsString; 
				nextPut: $);
				nextPut: $;;
				nextPut: Character cr ].
	s nextPutAll: ');out body;>;out skel qt;'.
	z := ZnClient new.
	z
		url: 'http://overpass-api.de/api/interpreter';
		queryAt: 'data'
		put: s contents. 
		"self halt."
		z contentReader: [ :entity | NeoJSONReader fromString: entity contents ].
		^ z get.