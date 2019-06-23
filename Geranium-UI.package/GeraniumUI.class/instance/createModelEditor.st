initialization
createModelEditor

	modelEditor := GlamourPresentationPresenter new.
	"modelEditor presentationClass: GTPlayground startOn: (GTPlayPage new saveContent: (self class >> (self scenario)) sourceWithoutSelector; title: 'GeraniumDSL')."
	modelEditor presentationClass: GeraniumPlayground startOn: (GTPlayPage new saveContent: (self class >> (self scenario)) sourceWithoutSelector; title: 'GeraniumDSL').
	modelEditor glmPres geraniumUI: self.