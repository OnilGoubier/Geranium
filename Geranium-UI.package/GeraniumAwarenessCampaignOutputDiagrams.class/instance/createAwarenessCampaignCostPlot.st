initialization
createAwarenessCampaignCostPlot

	| spPoints awPhone awConcertation awCampaign awpPoints awcPoints totalCostPhone totalCostConcertation totalResidences "processed "|
	
	awarenessCampaignCostPlot := RoassalModel new.
	awarenessCampaignCostPlot 
		script: [ :v :c | |b |
			"processed ifNil: [processed := true. self processCanvas: c and: v]."
			awCampaign  := report inputVisitor awarenessCampaign.
			awPhone := awCampaign awarenessPhoneCallCost.
			awConcertation := awCampaign awarenessConcertationCost.
			totalResidences := (awCampaign residences at: 1) size.
			totalCostPhone := 0.
			totalCostConcertation := 0.
			awcPoints := OrderedCollection new.
			awpPoints := OrderedCollection new.
			
			awConcertation  isEmpty 
				ifTrue: [ awcPoints add: 0 ]
				ifFalse: 
				[awConcertation do: 
					[ :each | totalCostConcertation := each + totalCostConcertation.				
		 			awcPoints add: (totalCostConcertation round: 1)]].
			
			awPhone isEmpty 
				ifTrue: [ awpPoints add: 0 ]
				ifFalse: 
					[awPhone do: 
						[ :each | totalCostPhone := each + totalCostPhone.
		 				awpPoints add: (totalCostPhone round: 1)]].
				
				spPoints := { awcPoints . awpPoints  }.
				b := spPoints connectedMultipleDottedPlots: { Color purple . Color orange } 
						withLabels: { 'Concertation' . 'Phone' }
						withXYLabels: {'Cost €' . 'Nb Of Times' }
						inView: v.
			b build.
			v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
			v @ RTZoomableView.
			v @ RTDraggableView.
			v]