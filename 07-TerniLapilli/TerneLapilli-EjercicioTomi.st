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

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/5/2018 17:44:16'!
test07lasPrimerasFichasSePonenBien

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli newGame.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@2).
	
	terniLapilli  ponerFichaOenPosicion: (3@2).
	

	
	self assert: [terniLapilli celdasDeX size = 3 and: [terniLapilli celdasDeO size = 3]].
	"self deny: (terniLapilli hayFicha: #o enPoscicion: (1@3))."! !


!classDefinition: #TerniLapilli category: #'TerneLapilli-Ejercicio'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'celdasDeX celdasDeO estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

!TerniLapilli methodsFor: 'acceso' stamp: 'tj 11/5/2018 17:40:48'!
celdasDeO
	
	^celdasDeO! !

!TerniLapilli methodsFor: 'acceso' stamp: 'tj 11/3/2018 18:33:55'!
celdasDeX
	
	^celdasDeX! !

!TerniLapilli methodsFor: 'acceso' stamp: 'tj 11/7/2018 16:18:38'!
ganador

	^ estado ganador: self! !

!TerniLapilli methodsFor: 'acceso' stamp: 'tj 11/6/2018 16:17:34'!
juegoVacio
	
	^ celdasDeX isEmpty and: [celdasDeO  isEmpty ].! !


!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:22:23'!
moverFichaOdesde: unaCelda a: unaCeldaContigua

	estado moverFichaOdesde: unaCelda a:  unaCeldaContigua en: self! !

!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:05:09'!
moverFichaXdesde: unaCelda a: unaCeldaContigua

	estado moverFichaXdesde: unaCelda a:  unaCeldaContigua en: self! !

!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:03:08'!
ponerFichaOenPosicion: unaCelda 

	estado ponerFichaOenPosicion: unaCelda sobre: self! !

!TerniLapilli methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:03:21'!
ponerFichaXenPosicion: unaCelda 

	estado ponerFichaXenPosicion: unaCelda sobre: self! !


!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/3/2018 18:26:23'!
celdaLibre: aPoint 
	
	^ ((celdasDeX includes: aPoint) or: [celdasDeO includes: aPoint]) not.! !

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

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/7/2018 17:36:04'!
tresEnRaya: unConjuntoConTresCeldasPertenecientesAUnJugador

	|diagonal fila columna |
	
	diagonal _ ((unConjuntoConTresCeldasPertenecientesAUnJugador includes: (1@1)) and: [(unConjuntoConTresCeldasPertenecientesAUnJugador includes: (2@2)) and: [unConjuntoConTresCeldasPertenecientesAUnJugador includes: (3@3)]]) 
	or: [(unConjuntoConTresCeldasPertenecientesAUnJugador includes: (1@3)) and: [(unConjuntoConTresCeldasPertenecientesAUnJugador includes: (2@2)) and: [unConjuntoConTresCeldasPertenecientesAUnJugador includes: (3@1)]]].
	
	columna _ false.
	
	fila _ false.	
	
	1 to: 3 do: [:c  | fila _ (fila) or: [ (unConjuntoConTresCeldasPertenecientesAUnJugador includes: (c@1)) and: [(unConjuntoConTresCeldasPertenecientesAUnJugador includes: (c@2)) and: [unConjuntoConTresCeldasPertenecientesAUnJugador includes: (c@3)]]]].
	
	1 to: 3 do: [:c  | columna _ columna or: ((unConjuntoConTresCeldasPertenecientesAUnJugador includes: (1@c)) and: (unConjuntoConTresCeldasPertenecientesAUnJugador includes: (2@c)) and: (unConjuntoConTresCeldasPertenecientesAUnJugador includes: (3@c))) ]	.
		
	^diagonal or: fila or: columna.! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/7/2018 16:20:36'!
tresOEnRaya

	^ self tresEnRaya: self celdasDeO! !

!TerniLapilli methodsFor: 'validaciones' stamp: 'tj 11/7/2018 15:43:14'!
tresXEnRaya

	^ self tresEnRaya: self celdasDeX .! !


!TerniLapilli methodsFor: 'inicializacion' stamp: 'tj 11/6/2018 16:51:41'!
initialize
	
	celdasDeX _ OrderedCollection new.
	
	celdasDeO _ OrderedCollection  new.
	
	estado _ TerniLapilliTurnoDePonerFichasX .
	! !


!TerniLapilli methodsFor: 'estado' stamp: 'tj 11/7/2018 17:39:36'!
avanzarAlProximoEstado
	
	|proximoEstado subclases|
	
	subclases _ TerniLapilliEstado subclasses.
	
	proximoEstado _ subclases detect:[: unEstado | unEstado esEstadoSiguientePara: self].
	
	estado _ proximoEstado .! !

!TerniLapilli methodsFor: 'estado' stamp: 'tj 11/7/2018 17:36:39'!
estado
	
	^estado! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'TerneLapilli-Ejercicio'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'inicializacion' stamp: 'tj 11/1/2018 19:46:14'!
newGame

	^ self new initialize.! !


!classDefinition: #TerniLapilliEstado category: #'TerneLapilli-Ejercicio'!
Object subclass: #TerniLapilliEstado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliEstado class' category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado class
	instanceVariableNames: ''!

!TerniLapilliEstado class methodsFor: 'validaciones' stamp: 'tj 11/7/2018 17:19:53'!
validarPosicionamientoDeUnaFichaEn: unaCelda sobre: unaPartidaDeTerniLapilli .

	(unaCelda x > 3 or: [unaCelda y > 3 or: [unaCelda x < 1 or: [unaCelda y < 1]]]) ifTrue: [self error: self coordenadasFueraDeRango].

	(unaPartidaDeTerniLapilli celdaLibre: unaCelda) ifFalse: [self error: (self celdaOcupada: unaCelda )].

	
! !


!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:25:14'!
celdaOcupada: unaCelda

	^ 'La celda ', unaCelda printString, ' se encuentra ocupada'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/7/2018 17:12:08'!
celdasNoContiguas

	^   'Las celdas no son contiguas'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/7/2018 17:20:09'!
coordenadasFueraDeRango

	^  'La celda debe tener coordenadas mayores o iguales a 1 y menores o iguales a 3'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/7/2018 17:41:42'!
juegoTerminado

	^ 'Juego terminado'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/7/2018 17:11:01'!
laFichaNoEsDelJugador

	^  'La ficha no pertenece al jugador'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/7/2018 17:45:57'!
partidaNoTerminada

	^ 'La partida aun no termino'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:22:04'!
tableroCompleto

	^ 'El jugador x ya puso todas sus fichas'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:18:54'!
turnoDeO

	^ 'El turno corresponde al jugador o'! !

!TerniLapilliEstado class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:18:37'!
turnoDeX

	^ 'El turno corresponde al jugador x'! !


!TerniLapilliEstado class methodsFor: 'estado' stamp: 'tj 11/6/2018 16:11:57'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	self subclassResponsibility ! !

!TerniLapilliEstado class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:46:53'!
ganador: unaPartidaDeTerniLapilli

	self subclassResponsibility ! !


!TerniLapilliEstado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:17:29'!
moverFichaPertenecienteA: unConjuntoDeFichasDeUnJugador desde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli 

	(unConjuntoDeFichasDeUnJugador includes: unaCelda ) ifFalse: [self error: self laFichaNoEsDelJugador ].
	
	(unaPartidaDeTerniLapilli laCelda: unaCelda esContiguaA: unaCeldaContigua) ifFalse: [self error: self celdasNoContiguas].
		
	(unaPartidaDeTerniLapilli celdaLibre: unaCeldaContigua ) ifFalse: [self error: (self celdaOcupada: unaCeldaContigua) ].
	
	unConjuntoDeFichasDeUnJugador add: unaCeldaContigua .
	
     unConjuntoDeFichasDeUnJugador remove: unaCelda.

	unaPartidaDeTerniLapilli avanzarAlProximoEstado

	! !


!classDefinition: #JuegoTerminado category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #JuegoTerminado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoTerminado class' category: #'TerneLapilli-Ejercicio'!
JuegoTerminado class
	instanceVariableNames: ''!

!JuegoTerminado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:42:13'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self juegoTerminado! !

!JuegoTerminado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:42:18'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self juegoTerminado! !

!JuegoTerminado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:42:24'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli

	self error: self juegoTerminado! !

!JuegoTerminado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:41:05'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli

	self error: self juegoTerminado! !


!JuegoTerminado class methodsFor: 'estado' stamp: 'tj 11/6/2018 16:11:50'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli tresOEnRaya ) or:[unaPartidaDeTerniLapilli tresXEnRaya ].! !

!JuegoTerminado class methodsFor: 'estado' stamp: 'tj 11/7/2018 16:20:10'!
ganador: unaPartidaDeTerniLapilli

	unaPartidaDeTerniLapilli tresOEnRaya ifTrue: [^ 'El jugador O es el ganador'].
	
	^ 'El jugador X es el ganador'.! !


!classDefinition: #TerniLapilliTurnoDeMoverO category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TerniLapilliTurnoDeMoverO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliTurnoDeMoverO class' category: #'TerneLapilli-Ejercicio'!
TerniLapilliTurnoDeMoverO class
	instanceVariableNames: ''!

!TerniLapilliTurnoDeMoverO class methodsFor: 'estado' stamp: 'tj 11/6/2018 17:09:49'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli estado isKindOf: TerniLapilliTurnoDeMoverX class) and: [unaPartidaDeTerniLapilli celdasDeO size = 3].! !

!TerniLapilliTurnoDeMoverO class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:45:22'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !


!TerniLapilliTurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:07:53'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli
		
		self moverFichaPertenecienteA: self celdasDeO desde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli  .! !

!TerniLapilliTurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:07:41'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self class turnoDeO .! !

!TerniLapilliTurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/6/2018 17:22:44'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self error tableroCompleto .
			! !

!TerniLapilliTurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/6/2018 17:22:34'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self class turnoDeO .
			! !


!classDefinition: #TerniLapilliTurnoDeMoverX category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TerniLapilliTurnoDeMoverX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliTurnoDeMoverX class' category: #'TerneLapilli-Ejercicio'!
TerniLapilliTurnoDeMoverX class
	instanceVariableNames: ''!

!TerniLapilliTurnoDeMoverX class methodsFor: 'estado' stamp: 'tj 11/6/2018 17:09:33'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ ((unaPartidaDeTerniLapilli estado isKindOf: TerniLapilliTurnoDePonerFichasO class) or:[unaPartidaDeTerniLapilli estado isKindOf: TerniLapilliTurnoDeMoverO class]) and: [unaPartidaDeTerniLapilli celdasDeX size = 3].! !

!TerniLapilliTurnoDeMoverX class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:47:05'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !


!TerniLapilliTurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:07:22'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli
		
	self error: self class turnoDeX .! !

!TerniLapilliTurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:07:12'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli

	self moverFichaPertenecienteA: self celdasDeX desde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli  .! !

!TerniLapilliTurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/6/2018 17:21:18'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self class turnoDeX .
			
	
			! !

!TerniLapilliTurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/6/2018 17:21:46'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self class tableroCompleto.
			
	
			! !


!classDefinition: #TerniLapilliTurnoDePonerFichasO category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TerniLapilliTurnoDePonerFichasO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliTurnoDePonerFichasO class' category: #'TerneLapilli-Ejercicio'!
TerniLapilliTurnoDePonerFichasO class
	instanceVariableNames: ''!

!TerniLapilliTurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:06:41'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self class tableroIncompleto .! !

!TerniLapilliTurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:06:29'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self class turnoDeO .! !

!TerniLapilliTurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/7/2018 16:00:27'!
ponerFichaOenPosicion: unaCelda sobre: unaPartidaDeTerniLapilli
		
	self validarPosicionamientoDeUnaFichaEn: unaCelda sobre: unaPartidaDeTerniLapilli .
	
	unaPartidaDeTerniLapilli celdasDeO add: unaCelda .
	
	unaPartidaDeTerniLapilli avanzarAlProximoEstado
			
			
	
			
	! !

!TerniLapilliTurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/6/2018 17:19:23'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self class turnoDeO .
			
	
			! !


!TerniLapilliTurnoDePonerFichasO class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:17:39'!
tableroIncompleto

	^ 'El jugador o no puso todas las fichas todavía'! !

!TerniLapilliTurnoDePonerFichasO class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:17:35'!
turnoEquivocado

	^ 'El turno corresponde al jugador o'! !


!TerniLapilliTurnoDePonerFichasO class methodsFor: 'estado' stamp: 'tj 11/6/2018 17:08:53'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli estado isKindOf: TerniLapilliTurnoDePonerFichasX class) .! !

!TerniLapilliTurnoDePonerFichasO class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:47:09'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !


!classDefinition: #TerniLapilliTurnoDePonerFichasX category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TerniLapilliTurnoDePonerFichasX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliTurnoDePonerFichasX class' category: #'TerneLapilli-Ejercicio'!
TerniLapilliTurnoDePonerFichasX class
	instanceVariableNames: ''!

!TerniLapilliTurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:06:14'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self class turnoEquivocado .! !

!TerniLapilliTurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 17:05:21'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self class tableroIncompleto.! !

!TerniLapilliTurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 16:22:30'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self turnoDeX.
			
	
			
	! !

!TerniLapilliTurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 16:00:15'!
ponerFichaXenPosicion: unaCelda sobre: unaPartidaDeTerniLapilli

	self validarPosicionamientoDeUnaFichaEn: unaCelda sobre: unaPartidaDeTerniLapilli .
	
	unaPartidaDeTerniLapilli celdasDeX add: unaCelda .
	
	unaPartidaDeTerniLapilli avanzarAlProximoEstado.
	

			! !


!TerniLapilliTurnoDePonerFichasX class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:15:11'!
tableroIncompleto

	^ 'El jugador x no puso todas las fichas todavía'! !

!TerniLapilliTurnoDePonerFichasX class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:17:01'!
turnoEquivocado

	^ 'El turno corresponde al jugador x'! !


!TerniLapilliTurnoDePonerFichasX class methodsFor: 'estado' stamp: 'tj 11/6/2018 17:09:41'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli estado isKindOf: TerniLapilliTurnoDePonerFichasO class) and: [unaPartidaDeTerniLapilli celdasDeX size < 3].! !

!TerniLapilliTurnoDePonerFichasX class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:47:13'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !
