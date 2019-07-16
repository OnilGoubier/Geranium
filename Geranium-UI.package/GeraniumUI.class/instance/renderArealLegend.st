rendering
renderArealLegend
	areaLegend
		ifNil: [ "should be se by the dsl normally"
			areaLegend := {
				self legendItemAt: 10 
					colored: ((self typesColors at:(self areasTypes at:'Log. Accession')) alpha: 0.5) 
					text: 'Log. Accession - SocialHousing'.
				self legendItemAt: 14 
					colored: ((self typesColors at:(self areasTypes at:'St. Eloi Collec.')) alpha: 0.5)
					text: 'St. Eloi Collec. -  HLM NewBlock'.
				self legendItemAt: 18
					colored: ((self typesColors at:(self areasTypes at:'St. Eloi Indiv.')) alpha: 0.5)
					text: 'St. Eloi Indiv. -  Private Housing'.
				self legendItemAt: 22
					colored: ((self typesColors at:(self areasTypes at:'Geranium')) alpha: 0.5)
					text: 'Geranium. - HLM Renovated'.
				self legendItemAt: 26
					colored: ((self typesColors at:(self areasTypes at:'Geranium 2'))alpha: 0.5) 
					text: 'Geranium 2 - HLM Housing'.
				self legendItemAt: 30 
					colored: ((self typesColors at:(self areasTypes at:'Geranium 3')) alpha: 0.5)
					text: 'Geranium 3 - HLM NewBlock'.
				self legendItemAt: 34 
					colored: (Color gray  alpha: 0.5) 
					text: 'Other'.
			} flatten do: [ :i | mapView view add: i ] ]