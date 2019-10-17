file in/out
openFile

	|dir|
	dir := self chooseFileToOpen.
	dir isNotNil ifTrue:
		[^ self readFromAFile: dir] 