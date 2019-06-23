tests
testFrequencies
	"comment stating purpose of message"

	self assert: ((frequencies at: #x) between: 90 and: 110 ).
	self assert: ((frequencies at: #y) between: 180 and: 220 ).
	self assert: ((frequencies at: #z) between: 630 and: 770 ).
	self assert: ((frequencies at: #x) + (frequencies at: #y) + (frequencies at: #z) ) equals: 1000