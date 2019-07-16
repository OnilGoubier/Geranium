accessing
residencesUpdate

	^ residences := (buildings collect: [ :b | b residences ]) deepFlatten 