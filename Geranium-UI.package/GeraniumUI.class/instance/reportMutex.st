accessing
reportMutex

	"^ reportMutex ifNil: [ reportMutex := Mutex new ]"
	^ reportMutex ifNil: [ reportMutex := Mutex new initialize ]