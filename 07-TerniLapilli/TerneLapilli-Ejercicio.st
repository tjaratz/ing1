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

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/1/2018 20:52:06'!
test03losTurnosDebenAlternarse

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFicha: #x enPosicion: (1@2).
	
	self assert: (terniLapilli hayFicha: #x enPosicion: (1@2)).
	
	self should: [terniLapilli ponerFicha: #x enPosicion: (1@2).] raise: Error  withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al otro jugador'] .
	
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
	instanceVariableNames: 'board jugadorActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/1/2018 20:47:17'!
hayFicha: aSymbol enPosicion: aPoint 
	
	^ board tiene: aSymbol enPosicion: aPoint.! !

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/1/2018 19:42:04'!
isEmpty
	
	^ board isEmpty.! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'tj 11/1/2018 21:01:56'!
initialize
	
	jugadorActual _ #x.

	board _ Board initialize.! !


!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/1/2018 20:26:14'!
ponerFicha: aSymbol enPosicion: aPoint 

	jugadorActual = aSymbol ifFalse: [self error: 'El turno corresponde al otro jugador'].
	
	board put: aSymbol in: aPoint.
	
	 aSymbol = #x ifTrue: [jugadorActual _ #o] ifFalse:  [jugadorActual _ #x]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'TerneLapilli-Ejercicio'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'tj 11/1/2018 19:46:14'!
newGame

	^ self new initialize.! !
