rendering
renderArealLegend
	areaLegend
		ifNil: [ "should be se by the dsl normally"
			areaLegend := {
				self legendItemAt: 18 
					colored: (Color cyan alpha: 0.5) 
					text: 'Log. Accession'.
				self legendItemAt: 20 
					colored: ((self typesColors at:(self areasTypes at:'St. Eloi Collec.')) alpha: 0.5)
					text: 'St. Eloi Collec. -  HLM NewBlock'.
				self legendItemAt: 22 
					colored: ((self typesColors at:(self areasTypes at:'St. Eloi Indiv.')) alpha: 0.5)
					text: 'St. Eloi Indiv. -  Private Housing'.
				self legendItemAt: 24
					colored: ((self typesColors at:(self areasTypes at:'Geranium')) alpha: 0.5)
					text: 'Geranium. - HLM Renovated'.
				self legendItemAt: 26
					colored: ((self typesColors at:(self areasTypes at:'Geranium 2'))alpha: 0.5) 
					text: 'Geranium 2 - HLM Housing'.
				self legendItemAt: 28 
					colored: ((self typesColors at:(self areasTypes at:'Geranium 3')) alpha: 0.5)
					text: 'Geranium 3 - HLM NewBlock'.
				self legendItemAt: 30 
					colored: (Color orange alpha: 0.9) 
					text: 'Other'.
			} flatten do: [ :i | mapView view add: i ] ]