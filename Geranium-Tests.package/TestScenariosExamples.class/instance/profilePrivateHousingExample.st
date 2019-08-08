as yet unclassified
profilePrivateHousingExample

"
TestScenariosExamples new profilePrivateHousingExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	"scenario inspect."
	profile := Profile retrieve: #PrivateHousing.
	profile awareness.
	profile inspect.
	