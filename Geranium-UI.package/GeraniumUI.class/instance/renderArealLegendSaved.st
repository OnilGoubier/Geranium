rendering
renderArealLegendSaved
	areaLegend
		ifNil: [ "should be se by the dsl normally"
			areaLegend := {
				self legendItemAt: 15 colored: (Color blue alpha: 0.9) text: 'Log. Accession'.
				self legendItemAt: 18 colored: (Color green alpha: 0.9) text: 'St. Eloi Collec. HLM NewBlock'.
				self legendItemAt: 21 colored: (Color red alpha: 0.9) text: 'St. Eloi Indiv. Private Housing'.
				self legendItemAt: 24 colored: (Color orange alpha: 0.5) text: 'Geranium. HLM Renovated'.
				self legendItemAt: 27 colored: (Color cyan alpha: 0.5) text: 'Geranium 2 HLM Housing'.
				self legendItemAt: 30 colored: (Color magenta alpha: 0.5) text: 'Geranium 3 HLM NewBlock'.
				self legendItemAt: 33 colored: (Color orange alpha: 0.9) text: 'Other'.
			} flatten do: [ :i | mapView view add: i ] ]