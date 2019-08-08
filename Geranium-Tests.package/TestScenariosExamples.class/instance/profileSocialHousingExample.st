as yet unclassified
profileSocialHousingExample

"
TestScenariosExamples new profileSocialHousingExample
"

	self fullGeraniumTestScript.
	scenario := Scenario retrieve: #GeraniumTest.
	"scenario inspect."
	profile := Profile retrieve: #SocialHousing.
	profile awareness.
	profile inspect.
	