!classDefinition: #I category: #'Quinta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta Actividad'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'tj 9/15/2018 19:34:56'!
* unNumeroDePeano
	^ unNumeroDePeano .! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:44:20'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:52:52'!
- unNumeroDePeano

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:52:38'!
/ unNumeroDePeno

		unNumeroDePeno = I ifTrue: [^ I].
		
		unNumeroDePeno <= self ifFalse: [self error:  self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].

		
		
		! !

!I class methodsFor: 'as yet unclassified' stamp: 'tj 9/16/2018 21:22:53'!
<= unNumeroDePeano
	
	^ true.! !

!I class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:51:22'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^  'no se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:28:12'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'no se puede restar por un numero mayor o igual'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:29:22'!
next

	^II! !


!classDefinition: #II category: #'Quinta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta Actividad'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:03:03'!
* unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self].
	
	^ self + (self * unNumeroDePeano previous).! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:02:12'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:02:12'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:16'!
/ unNumeroDePeano

	unNumeroDePeano <= self ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano  = self ifTrue: [^ I].
	
	unNumeroDePeano = I ifTrue: [^ self].
	
	unNumeroDePeano <= (self - unNumeroDePeano)  ifTrue: [^ (I + ((self - unNumeroDePeano) / unNumeroDePeano)) ] ifFalse: [^  I]! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:02:34'!
<= unNumeroDePeano
	
	unNumeroDePeano  = I ifTrue: [^ false] ifFalse: [^ self previous <= unNumeroDePeano previous].! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:51:58'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'no se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:54:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:48:10'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:48:32'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:02:12'!
previous

	^prev! !

!II class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:00:57'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #III category: #'Quinta Actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Quinta Actividad'!
III class
	instanceVariableNames: 'next prev'!

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
* unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self].
	
	^ self + (self * unNumeroDePeano previous).! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
/ unNumeroDePeano

	unNumeroDePeano <= self ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano  = self ifTrue: [^ I].
	
	unNumeroDePeano = I ifTrue: [^ self].
	
	unNumeroDePeano <= (self - unNumeroDePeano)  ifTrue: [^ (I + ((self - unNumeroDePeano) / unNumeroDePeano)) ] ifFalse: [^  I]! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
<= unNumeroDePeano
	
	unNumeroDePeano  = I ifTrue: [^ false] ifFalse: [^ self previous <= unNumeroDePeano previous].! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'no se puede dividir por un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:54:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	prev := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
previous

	^prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #IIII category: #'Quinta Actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Quinta Actividad'!
IIII class
	instanceVariableNames: 'next prev'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
* unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self].
	
	^ self + (self * unNumeroDePeano previous).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [^self previous].

	^self previous - unNumeroDePeano previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
/ unNumeroDePeano

	unNumeroDePeano <= self ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	
	unNumeroDePeano  = self ifTrue: [^ I].
	
	unNumeroDePeano = I ifTrue: [^ self].
	
	unNumeroDePeano <= (self - unNumeroDePeano)  ifTrue: [^ (I + ((self - unNumeroDePeano) / unNumeroDePeano)) ] ifFalse: [^  I]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
<= unNumeroDePeano
	
	unNumeroDePeano  = I ifTrue: [^ false] ifFalse: [^ self previous <= unNumeroDePeano previous].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'no se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:54:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next prev: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
prev: unNumeroDePeano

	prev _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
previous

	^prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'tj 9/17/2018 12:53:40'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!