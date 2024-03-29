examples
retrieveMapDataDefinedAs: overpassDataTypeAndParamPairsStrings positionedWithInBoundingBoxSaved: positionBoxSouthWestNorthEastAsString
	
	| s |
	
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
	^ ZnClient new
		url: 'http://overpass-api.de/api/interpreter';
		queryAt: 'data'
		put: s contents; 
		contentReader: [ :entity | NeoJSONReader fromString: entity contents ];
		get