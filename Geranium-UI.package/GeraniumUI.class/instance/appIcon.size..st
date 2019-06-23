helper
appIcon: aSymbol size: aPoint

	"^ ((FileSystem  workingDirectory / 'icons' / aSymbol asString , 'png') readStreamDo: [ :s | ImageReadWriter formFromStream:  s ]) scaledToSize: aPoint"
	
	^(ImageReadWriter formFromStream: (FileSystem  workingDirectory / 'icons' / aSymbol asString , 'png') asFileReference binaryReadStream) scaledToSize: aPoint.