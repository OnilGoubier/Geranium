visiting
computeAllBuildingsFor: aNumber

	| buildingsOrg residencesTypes|

	
	"Todo: make the algorithm independent of the data !!! OG"
	residencesTypes := (self residences collect: [ :r | ((self modelToScenarioDict at: r) first) name ]).
	buildingsOrg := OrderedCollection new.
	(residencesTypes frequencies) keysAndValuesDo: 
			[ :k :v | | f tb mykey| 
				f := ((v/aNumber) asFloat rounded).
				((k = #HLMNew) or: (k = #HLMRenovated)) 
					ifTrue:
						[mykey := k ,'Block'.
						tb :=  buildings select: [:b | "self halt. "
										(b isKindOf: AppartmentBlock)
										and: 
										((self modelToScenarioDict at: b) first name = mykey )]."self halt."
										buildingsOrg addAll: (tb first: ((v/(12*aNumber)) asFloat rounded))]
					ifFalse: 
						[buildingsOrg addAll: 
							(( buildings select: 
										[:b | ((b isKindOf: House)
												and: 
												(((self modelToScenarioDict at: b) first) name = k))]) first: f)]].
									
			^buildingsOrg 
	
	