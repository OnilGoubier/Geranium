file in/out
writeOnAFile: aText

| working stream fileName|
working := FileSystem disk workingDirectory.
fileName := UIManager default request: 'Please write your file name' initialAnswer: 'file name' title:'File Name'.
fileName isNotNil ifTrue:
	[stream := (working / fileName,'txt') writeStream.
	stream nextPutAll: aText asString.
	stream close.].