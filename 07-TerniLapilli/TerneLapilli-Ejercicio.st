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

!TerneLapilliTest methodsFor: 'tests' stamp: 'mf 11/5/2018 19:22:51'!
test02laPrimerFichaDebeSerX

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli new.
	
	self should: [terniLapilli ponerFichaOenPosicion: (1@2)] raise: Error withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al jugador x'] ! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/3/2018 18:35:06'!
test03losTurnosDebenAlternarse

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self assert: (terniLapilli celdasDeX includes:1@2).
	
	self should: [terniLapilli ponerFichaXenPosicion: (1@2).] raise: Error  withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al jugador o'] .
	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'mf 11/5/2018 19:22:05'!
test04ponerFichaDeberiaAgregarLaFichaAlJuego

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli new.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self assert: (terniLapilli hayFicha: #x enPosicion: (1@2)).! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'mf 11/7/2018 16:00:57'!
test05ponerFichaMalTiraError

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli new.
	
	self should: [terniLapilli ponerFichaXenPosicion: (4@6).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'El punto es inválido'] .! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'mf 11/5/2018 19:22:15'!
test06ponerFichaDeberiaNoAgregarOtrasFichas

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli new.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self deny: (terniLapilli hayFicha: #o enPosicion: (1@3)).! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'mf 11/5/2018 19:39:00'!
test07lasPrimerasFichasSePonenBien

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli new.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@2).
		
	self assert: [terniLapilli celdasDeX size = 3 and: [terniLapilli celdasDeO size = 2]].
	"self deny: (terniLapilli hayFicha: #o enPoscicion: (1@3))."! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'mf 11/5/2018 19:17:26'!
test08moverFichaFunciona

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@1).
	
	terniLapilli  moverFichaX: (3@1) aPosicion: (3@2).
	
	
	self assert: [terniLapilli juegoTerminado ].
	"self deny: (terniLapilli hayFicha: #o enPoscicion: (1@3))."! !


!classDefinition: #CeldasContiguas category: #'TerneLapilli-Ejercicio'!
Object subclass: #CeldasContiguas
	instanceVariableNames: 'celdas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!


!classDefinition: #TerniLapilli category: #'TerneLapilli-Ejercicio'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'celdasDeX celdasDeO jugadorActual ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/5/2018 17:40:48'!
celdasDeO
	
	^celdasDeO! !

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/3/2018 18:33:55'!
celdasDeX
	
	^celdasDeX! !

!TerniLapilli methodsFor: 'accesing' stamp: 'mf 11/5/2018 19:25:50'!
hayFicha: aSymbol enPosicion: aPoint 
	
	^ aSymbol = #x ifTrue: [(celdasDeX includes: aPoint)] ifFalse: [celdasDeO includes: aPoint].! !

!TerniLapilli methodsFor: 'accesing' stamp: 'tj 11/3/2018 18:01:04'!
isEmpty
	
	^ celdasDeX isEmpty and: [celdasDeO  isEmpty ].! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'tj 11/3/2018 18:00:30'!
initialize
	
	jugadorActual _ #x.

	celdasDeX _ OrderedCollection new.
	
	celdasDeO _ OrderedCollection  new.
	
	! !


!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/5/2018 18:45:31'!
moverFichaO: unaCelda aPosicion: unaCeldaContigua

	self juegoTerminado ifTrue: [self error: 'El juego termino'].

	jugadorActual = 'o' ifFalse: [self error: 'El turno corresponde al jugador x'].
	
	(self puedeOMoverFicha) ifFalse: [self error: 'El jugador o no puso todas sus fichas todavia'].
	
	(self laCeldaEstaOcupadaPorO: unaCelda ) ifFalse: [self error: 'La ficha no pertenece al jugador o'].
	
	(self laCelda: unaCelda 	esContiguaA: unaCeldaContigua) ifFalse: [self error: 'Las celdas no son contiguas'].
	
	(self celdaLibre: unaCeldaContigua ) ifFalse: [self error: 'La celda ', unaCeldaContigua  printString,' no se encuentra libre'].
	
	(self celdaLibre: unaCeldaContigua) ifFalse: [self error: 'La celda ', unaCeldaContigua printString, ' se encuentra ocupada'].
	
	celdasDeO add: unaCeldaContigua .
	
	celdasDeO remove: unaCelda.
			
	jugadorActual _ 'x'.
	
	(self tresOEnRaya) ifTrue: [ganador _ 'o'].
! !

!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/5/2018 18:44:25'!
moverFichaX: unaCelda aPosicion: unaCeldaContigua

	self juegoTerminado ifTrue: [self error: 'El juego termino'].

	jugadorActual = 'x' ifFalse: [self error: 'El turno corresponde al jugador o'].
	
	(self puedeXMoverFicha) ifFalse: [self error: 'El jugador x no puso todas sus fichas todavia'].
	
	(self laCeldaEstaOcupadaPorX: unaCelda ) ifFalse: [self error: 'La ficha no pertenece al jugador x'].
	
	(self laCelda: unaCelda 	esContiguaA: unaCeldaContigua) ifFalse: [self error: 'Las celdas no son contiguas'].
	
	(self celdaLibre: unaCeldaContigua ) ifFalse: [self error: 'La celda ', unaCeldaContigua  printString,' no se encuentra libre'].
	
	(self celdaLibre: unaCeldaContigua ) ifFalse: [self error: 'La celda ', unaCeldaContigua printString, ' se encuentra ocupada'].
	
	celdasDeX add: unaCeldaContigua .
	
	celdasDeX remove: unaCelda.
			
	jugadorActual _ 'o'.
	
	(self tresXEnRaya) ifTrue: [ganador _ 'x'].
! !

!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/5/2018 18:28:09'!
ponerFichaOenPosicion: aPoint 

	self juegoTerminado ifTrue: [self error: 'El juego termino'].

	jugadorActual = 'o' ifFalse: [self error: 'El turno corresponde al jugador x'].
	
	(self puedeOPonerFicha) ifFalse: [self error: 'El jugador o ya puso todas sus fichas'].
	
	(self celdaLibre: aPoint) ifFalse: [self error: 'La celda ', aPoint printString, ' se encuentra ocupada'].
	
	celdasDeO add: aPoint .
			
	jugadorActual _ 'x'.
	
	(self tresOEnRaya) ifTrue: [ganador _ 'o'].! !

!TerniLapilli methodsFor: 'jugar' stamp: 'mf 11/7/2018 15:57:02'!
ponerFichaXenPosicion: aPoint 

	self juegoTerminado ifTrue: [self error: 'El juego termino'].

	jugadorActual = 'x' ifFalse: [self error: 'El turno corresponde al jugador o'].
	
	(self puedeXPonerFicha) ifFalse: [self error: 'El jugador x ya puso todas sus fichas'].
	(self puntoEntre1Y3: aPoint) ifFalse: [self error: 'El punto es inválido'].
	(self celdaLibre: aPoint) ifFalse: [self error: 'La celda ', aPoint printString, ' se encuentra ocupada'].
	
	celdasDeX add: aPoint .
			
	jugadorActual _ 'o'.
	
	(self tresXEnRaya) ifTrue: [ganador _ 'x'].! !

!TerniLapilli methodsFor: 'jugar' stamp: 'mf 11/7/2018 16:00:14'!
puntoEntre1Y3: aPoint

	^ aPoint x <= 3 and: aPoint x > 0 and: aPoint y > 0 and: aPoint y <=3.! !


!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:26:23'!
celdaLibre: aPoint 
	
	^ ((celdasDeX includes: aPoint) or: [celdasDeO includes: aPoint]) not.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:41:34'!
juegoTerminado

	^ (ganador = nil) not! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/5/2018 18:43:36'!
laCelda: unaCelda esContiguaA: otraCelda

	|celdasContiguas|.
	
	(unaCelda = (2@2)) ifTrue: [^ true].
	(otraCelda = (2@2)) ifTrue: [^ true].
	
	celdasContiguas _ Dictionary new.
	
	celdasContiguas at: 1@1 put: (OrderedCollection with: 1@2 with: 2@1 with: 2@2).
	celdasContiguas at: 1@2 put: (OrderedCollection with: 1@1 with: 1@3 with: 2@2).
	celdasContiguas at: 1@3 put: (OrderedCollection with: 1@2 with: 2@3 with: 2@2).
	
	celdasContiguas at: 2@1 put: (OrderedCollection with: 3@1 with: 1@1 with: 2@2).
	celdasContiguas at: 2@3 put: (OrderedCollection with: 1@3 with: 3@3 with: 2@2).
	
	celdasContiguas at: 3@1 put: (OrderedCollection with: 2@1 with: 3@2 with: 2@2).
	celdasContiguas at: 3@2 put: (OrderedCollection with: 3@1 with: 3@3 with: 2@2).
	celdasContiguas at: 3@3 put: (OrderedCollection with: 2@3 with: 3@2 with: 2@2).
	
	^ (celdasContiguas at: unaCelda) includes: otraCelda .

	
	! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/5/2018 17:55:33'!
laCeldaEstaOcupadaPorO: unaCelda

	^ self celdasDeO includes: unaCelda .

	
		! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/5/2018 17:55:39'!
laCeldaEstaOcupadaPorX: unaCelda

	^ self celdasDeX includes: unaCelda .

	
		! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/5/2018 18:28:45'!
puedeOMoverFicha

	^ self celdasDeO size = 3.
! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:37:08'!
puedeOPonerFicha
	
	^ celdasDeO size < 3.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/5/2018 18:28:51'!
puedeXMoverFicha

	^ self celdasDeX size = 3.
! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:24:46'!
puedeXPonerFicha
	
	^ celdasDeX size < 3.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:48:34'!
tresEnRayaO

	! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'mf 11/5/2018 19:31:19'!
tresOEnRaya

	|diagonal fila columna |

	diagonal _ ((celdasDeO includes: (1@1)) 
	and: (celdasDeO includes: (2@2))
	and: (celdasDeO includes: (3@3)))
	or: ((celdasDeO includes: (1@3)) 
	and: (celdasDeO includes: (2@2))
	and: (celdasDeO includes: (3@1))).
	
	columna _ false.
	fila _ false.
	
	1 to: 3 do: [:c  | fila _ (fila) or: ((celdasDeO includes: (c@1)) and: (celdasDeO includes: (2@c)) and: (celdasDeO includes: (3@c)) )]
	
	.	1 to: 3 do: [:c  | columna _ columna or: ((celdasDeO includes: (1@c)) and:
		(celdasDeO includes: (2@c)) and:
		(celdasDeO includes: (3@c)))
		 ]
	.
	(diagonal or: fila or: columna) ifTrue: [ganador _ 'o'].
	
	^diagonal or: fila or: columna.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'mf 11/5/2018 19:38:29'!
tresXEnRaya

	|diagonal fila columna |

	diagonal _ ((celdasDeX includes: (1@1)) 
	and: (celdasDeX includes: (2@2))
	and: (celdasDeX includes: (3@3)))
	or: ((celdasDeX includes: (1@3)) 
	and: (celdasDeX includes: (2@2))
	and: (celdasDeX includes: (3@1))).
	
	columna _ false.
	fila _ false.
	
	1 to: 3 do: [:c  | fila _ (fila) or: ((celdasDeX includes: (c@1)) and: (celdasDeX includes: (2@c)) and: (celdasDeX includes: (3@c)) )]
	
	.	1 to: 3 do: [:c  | columna _ columna or: ((celdasDeX includes: (1@c)) and:
		(celdasDeX includes: (2@c)) and:
		(celdasDeX includes: (3@c)))
		 ]
	.
		(diagonal or: fila or: columna) ifTrue: [ganador _ 'x'].
	
	^diagonal or: fila or: columna.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'TerneLapilli-Ejercicio'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'tj 11/1/2018 19:46:14'!
newGame

	^ self new initialize.! !


!classDefinition: #TerniLapilliState category: #'TerneLapilli-Ejercicio'!
Object subclass: #TerniLapilliState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!


!classDefinition: #TerniLapilliXState category: #'TerneLapilli-Ejercicio'!
TerniLapilliState subclass: #TerniLapilliXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!
