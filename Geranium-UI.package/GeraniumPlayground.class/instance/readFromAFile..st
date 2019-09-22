file in/out
readFromAFile: aFileName

| working stream content|
working := FileSystem disk workingDirectory.
stream := (working / aFileName) readStream.
content := stream contents.
stream close.
^content 