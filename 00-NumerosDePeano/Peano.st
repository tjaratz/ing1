!classDefinition: #I category: #Peano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Peano!
I class
	instanceVariableNames: 'prev'!

!I class methodsFor: 'as yet unclassified' stamp: 'mf 9/6/2018 21:40:12'!
+ p
	^ p next! !

!I class methodsFor: 'as yet unclassified' stamp: 'mf 9/12/2018 20:28:04'!
- p 
	^nil! !

!I class methodsFor: 'as yet unclassified' stamp: 'mf 9/12/2018 20:39:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := nil.! !

!I class methodsFor: 'as yet unclassified' stamp: 'mf 9/6/2018 21:25:27'!
next
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'mf 9/6/2018 21:48:54'!
prev
	^prev! !


!classDefinition: #II category: #Peano!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Peano!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'getters' stamp: 'mf 9/6/2018 21:43:30'!
+ p
	^ self prev + p next! !

!II class methodsFor: 'getters' stamp: 'mf 9/12/2018 20:37:35'!
- p
	(p isEqualTo: I) ifTrue: [^self prev].
	^ ((self prev) - (p prev)).! !

!II class methodsFor: 'getters' stamp: 'mf 9/12/2018 20:39:14'!
next
	next ifNil: [
			next _ self cloneNamed: self name, 'I'.
			next prev: self.
		].
	^ next! !

!II class methodsFor: 'getters' stamp: 'mf 9/6/2018 21:49:40'!
prev
	^prev! !


!II class methodsFor: 'setters' stamp: 'mf 9/6/2018 21:48:23'!
prev: pp
	prev _ pp.! !


!II class methodsFor: 'as yet unclassified' stamp: 'mf 9/12/2018 20:39:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := AnObsoleteIII.
	prev := I.! !

I initializeAfterFileIn!
II initializeAfterFileIn!