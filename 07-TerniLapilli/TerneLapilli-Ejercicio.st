!classDefinition: #TerneLapilliTest category: #'TerneLapilli-Ejercicio'!
TestCase subclass: #TerneLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/1/2018 20:43:04'!
test01newGameShouldReturnATerniLapilliWithAnEmptyBoard

	|terniLapilli|
	
	terniLapilli  _ TerniLapilli newGame.
	
	self assert: terniLapilli isEmpty.
	
	
	
	
	
	! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/1/2018 20:51:38'!
test02laPrimerFichaDebeSerX

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	self should: [terniLapilli ponerFicha: #o enPosicion: (1@2)] raise: Error withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al otro jugador'] ! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/3/2018 18:35:06'!
test03losTurnosDebenAlternarse

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self assert: (terniLapilli celdasDeX includes:1@2).
	
	self should: [terniLapilli ponerFichaXenPosicion: (1@2).] raise: Error  withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al jugador o'] .
	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/1/2018 20:52:21'!
test04ponerFichaDeberiaAgregarLaFichaAlJuego

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFicha: #x enPosicion: (1@2).
	
	self assert: (terniLapilli hayFicha: #x enPosicion: (1@2)).! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/1/2018 20:43:26'!
test06ponerFichaDeberiaNoAgregarOtrasFichas

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFicha: #x enPosicion: (1@2).
	
	self deny: (terniLapilli hayFicha: #o enPosicion: (1@3)).! !


!classDefinition: #Board category: #'TerneLapilli-Ejercicio'!
Object subclass: #Board
	instanceVariableNames: 'cells'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

!Board methodsFor: 'as yet unclassified' stamp: 'tj 11/1/2018 19:44:20'!
isEmpty

	^ true! !


!Board methodsFor: 'interact' stamp: 'tj 11/1/2018 20:53:47'!
put: aSymbol in: aPoint 
	cells put: aSymbol in: aPoint.! !


!Board methodsFor: 'accessors' stamp: 'tj 11/1/2018 21:04:51'!
initialize
	cells _ Array2D new 	.! !

!Board methodsFor: 'accessors' stamp: 'tj 11/1/2018 20:50:05'!
tiene: aSymbol enPosicion: aPoint 
	(cells at: aPoint) = aSymbol.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Board class' category: #'TerneLapilli-Ejercicio'!
Board class
	instanceVariableNames: 'cells'!


!classDefinition: #TerniLapilli category: #'TerneLapilli-Ejercicio'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'celdasDeX celdasDeO jugadorActual ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/3/2018 18:33:55'!
celdasDeX
	
	^celdasDeX! !

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/1/2018 20:47:17'!
hayFicha: aSymbol enPosicion: aPoint 
	
	^ board tiene: aSymbol enPosicion: aPoint.! !

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/3/2018 18:01:04'!
isEmpty
	
	^ celdasDeX isEmpty and: [celdasDeO  isEmpty ].! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'tj 11/3/2018 18:00:30'!
initialize
	
	jugadorActual _ #x.

	celdasDeX _ OrderedCollection new.
	
	celdasDeO _ OrderedCollection  new.
	
	! !


!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/5/2018 17:28:14'!
ponerFichaOenPosicion: aPoint 

	self juegoTerminado ifTrue: [self error: 'El juego termino'].

	jugadorActual = 'x' ifFalse: [self error: 'El turno corresponde al jugador y'].
	
	(self puedeXPonerFicha) ifFalse: [self error: 'El jugador x ya puso todas sus fichas'].
	
	(self celdaLibre: aPoint) ifFalse: [self error: 'La celda ', aPoint printString, ' se encuentra ocupada'].
	
	celdasDeX add: aPoint .
			
	jugadorActual _ 'o'.
	
	(self tresXEnRaya) ifTrue: [ganador _ 'x'].
! !

!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/3/2018 18:34:37'!
ponerFichaXenPosicion: aPoint 

	jugadorActual = 'x' ifFalse: [self error: 'El turno corresponde al jugador o'].
	
	(self puedeXPonerFicha) ifFalse: [self error: 'El jugador x ya puso todas sus fichas'].
	
	(self celdaLibre: aPoint) ifFalse: [self error: 'La celda ', aPoint printString, ' se encuentra ocupada'].
	
	celdasDeX add: aPoint .
		
	jugadorActual _ 'o'.! !


!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:26:23'!
celdaLibre: aPoint 
	
	^ ((celdasDeX includes: aPoint) or: [celdasDeO includes: aPoint]) not.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:41:34'!
juegoTerminado

	^ (ganador = nil) not! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:37:08'!
puedeOPonerFicha
	
	^ celdasDeO size < 3.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:24:46'!
puedeXPonerFicha
	
	^ celdasDeX size < 3.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:48:34'!
tresEnRayaO

	! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:53:05'!
tresOEnRaya

	^ self esDiagonalO or: [self esHorizontalO or: self esVerticalO.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'TerneLapilli-Ejercicio'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'tj 11/1/2018 19:46:14'!
newGame

	^ self new initialize.! !
