visiting
visitUrbanProfileForResidence: aUrbanProfileForResidence ofClass: aResidenceClass

	|residence category surface exposure occupantClass occupants numberOfChildren income awareness ownership transportMode consumptionChoice peakOffPeakHours|
	
	residence := aResidenceClass new.
	category := aUrbanProfileForResidence category.
	surface := aUrbanProfileForResidence surface.
	exposure := aUrbanProfileForResidence exposure. "will be nil for appartments and set
	by the appartmentBlock"
	transportMode := aUrbanProfileForResidence transportMode.
	consumptionChoice := aUrbanProfileForResidence consumptionChoice.
	peakOffPeakHours := aUrbanProfileForResidence peakOffPeakHours.
	
	residence
		category: category next; "might be a distribution .. for all these properties"
		surface: surface next.
		
	exposure ifNotNil: [ residence exposure: exposure next ].
	
	occupantClass := aUrbanProfileForResidence occupantClass.
	occupants := occupantClass next new.
	residence occupants: occupants.
	
	numberOfChildren := aUrbanProfileForResidence numberOfChildren.
	income := aUrbanProfileForResidence income.
	awareness := aUrbanProfileForResidence awareness.
	ownership := aUrbanProfileForResidence ownership.
	
	occupants
		income: income next;
		awareness: awareness next;
		ownership: ownership next;
		transportMode: transportMode next;
		consumptionChoice: consumptionChoice next;
		peakOffPeakHours: peakOffPeakHours next.
		
	numberOfChildren ifNotNil: [ occupants numberOfChildren: numberOfChildren next ].
	
	self associate: aUrbanProfileForResidence with: residence.
	
	^ residence