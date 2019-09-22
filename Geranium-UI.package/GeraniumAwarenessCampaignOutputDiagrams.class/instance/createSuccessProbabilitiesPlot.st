initialization
createSuccessProbabilitiesPlot

	| spPoints awPhone awConcertation awCampaign awpPoints awcPoints totalConvertedPhone totalConvertedConcertation totalResidences "processed" |
	
	successProbabilitiesPlot := RoassalModel new.
	successProbabilitiesPlot 
		script: [ :v :c | |b |
			"processed ifNil: [processed := true. self processCanvas: c and: v]."
			awCampaign  := report inputVisitor awarenessCampaign.
			awPhone := awCampaign awarenessPhoneCalls.
			awConcertation := awCampaign awarenessConcertations.
			totalResidences := (awCampaign residences at: 1) size.
			totalConvertedPhone := 0.
			totalConvertedConcertation := 0.
			awcPoints := OrderedCollection new.
			awpPoints := OrderedCollection new.
			
			awConcertation  isEmpty 
				ifTrue: [ awcPoints add: 0 ]
				ifFalse: 
				[awConcertation do: [ :each | 
					totalConvertedConcertation := (each convertedResidences size + 
															totalConvertedConcertation).
		 			awcPoints add: 
						((totalConvertedConcertation / totalResidences ) asFloat * 100 round: 1)]].
			
			awPhone isEmpty 
				ifTrue: [ awpPoints add: 0 ]
				ifFalse: 
					[ awPhone do: [ :each | 
						totalConvertedPhone  :=(each convertedResidences size + totalConvertedPhone).
		 				awpPoints add: (((totalConvertedPhone / totalResidences) asFloat * 100) round: 1)]].
				
				spPoints := { awcPoints . awpPoints  }.
				b := spPoints connectedMultipleDottedPlots: { Color purple . Color orange } 
						withLabels: { 'Concertation' . 'Phone' }
						withXYLabels: {'Converted residences %' . 'Nb Of Times' }
						inView: v.
			b build.
			v canvas camera "focusOnCenterScaled."focusOnCenterScaled: v canvas extent * self cameraScale.
			v @ RTZoomableView.
			v @ RTDraggableView.
			v]