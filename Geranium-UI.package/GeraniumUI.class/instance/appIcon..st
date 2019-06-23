helper
appIcon: aSymbol

	"^ ((FileSystem  workingDirectory / 'icons' / aSymbol asString , 'png') readStreamDo: [ :s | ImageReadWriter formFromStream:  s ]) scaledToSize: 36 @ 36"
	
	^(ImageReadWriter formFromStream:(FileSystem  workingDirectory / 'icons' / aSymbol asString , 'png') asFileReference binaryReadStream) scaledToSize: 36 @ 36.