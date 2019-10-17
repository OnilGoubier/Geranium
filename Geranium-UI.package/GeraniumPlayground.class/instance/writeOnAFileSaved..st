file in/out
writeOnAFileSaved: aText

| working stream fileName|
working := FileSystem disk workingDirectory.
fileName := UIManager default request: 'Please write your file name' initialAnswer: 'file name' title:'File Name'.
stream := (working / fileName,'txt') writeStream.
stream nextPutAll: aText asString.
stream close.