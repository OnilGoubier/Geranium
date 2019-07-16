as yet unclassified
transformBlockToResidence: aString

	(aString includesSubstring: 'Block') 
		ifTrue: [ ^aString removeSuffix: 'Block']
		ifFalse: [ ^aString ]

	