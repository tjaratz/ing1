!classDefinition: #TerneLapilliTest category: #'TerneLapilli-Tests'!
TestCase subclass: #TerneLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Tests'!

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:14:54'!
test01nuevoJuegoRetornaUnJuegoVacio

	|terniLapilli|
	
	terniLapilli  _ TerniLapilli nuevoJuego .
	
	self assert: terniLapilli juegoVacio .
	
	
	
	
	
	! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:15:17'!
test02laPrimerFichaDebeSerX

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	self should: [terniLapilli ponerFichaOenPosicion: (1@2)] raise: Error withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al jugador x'] ! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:18:11'!
test03losTurnosDebenAlternarse

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self assert: (terniLapilli celdasDeX includes:1@2).
		
	self should: [terniLapilli ponerFichaXenPosicion: (1@2).] raise: Error  withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al jugador o'] .
	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:03:50'!
test03_1losTurnosDebenAlternarse

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli ponerFichaOenPosicion: (2@2).
			
	self should: [terniLapilli ponerFichaOenPosicion: (1@2).] raise: Error  withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'El turno corresponde al jugador x'] .
	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:18:36'!
test04ponerFichaDeberiaAgregarLaFichaAlJuego

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self assert: (terniLapilli celdasDeX includes: (1@2)).! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:20:07'!
test05ponerFichaInvalidaGeneraExcepcion

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	self should: [terniLapilli ponerFichaXenPosicion: (4@6).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La celda debe tener coordenadas mayores o iguales a 1 y menores o iguales a 3'] .! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:45:25'!
test07lasPrimerasFichasSePonenBien

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@1).
	
	terniLapilli  ponerFichaOenPosicion: (3@2).
	
	self assert: [terniLapilli celdasDeX size = 3 and: [terniLapilli celdasDeO size = 3]].
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:25:44'!
test08moverFichaFunciona

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@1).
	
	terniLapilli moverFichaXdesde: 3@1 a: 3@2.
	
	self assert: (terniLapilli celdasDeX includes: 3@2).
	
	self deny: (terniLapilli celdasDeX includes: 3@1).! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:53:42'!
test09cuandoElJuegoTerminaNoSePuedeRealizarNingunaAccion

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@1).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@2).
	
	terniLapilli moverFichaXdesde: 3@2 a: 3@1.
			
	self should: [terniLapilli  moverFichaOdesde: 2@2 a: (1@2).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Juego terminado'] .

! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:54:38'!
test09_1cuandoElJuegoTerminaNoSePuedeRealizarNingunaAccion

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@1).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@1).
			
	self should: [terniLapilli  ponerFichaOenPosicion: (2@2).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Juego terminado'] .

! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:55:09'!
test10moverAunaCeldaNoContiguaGeneraExcepcion

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@1).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@1).
		
	self should: [terniLapilli moverFichaXdesde:  3@1 a: (3@3).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaXdesde:  3@1 a: (2@3).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaXdesde:  3@1 a: (1@1).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaXdesde:  3@1 a: (1@2).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaXdesde:  3@1 a: (1@3).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	
	terniLapilli moverFichaXdesde:  3@1 a: 3@2.
	
	self should: [terniLapilli moverFichaOdesde:  1@3 a: (1@1).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaOdesde:  1@3 a: (2@1).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaOdesde:  1@3 a: (3@1).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaOdesde:  1@3 a: (3@2).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
	self should: [terniLapilli moverFichaOdesde:  1@3 a: (3@3).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'Las celdas no son contiguas'] .
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:10:35'!
test11moverFichaHaciaUnaCeldaOcupadaGeneraExcepcion

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@1).
	
	self should: [terniLapilli moverFichaXdesde:  1@2 a: (1@3).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La celda 1@3 se encuentra ocupada'] .! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:55:45'!
test12ponerFichaEnUnaCeldaOcupadaGeneraExcepcion

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@2).
	
	self should: [terniLapilli ponerFichaOenPosicion: (1@2).] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La celda 1@2 se encuentra ocupada'] .! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 14:58:29'!
test13unJugadorNoPuedeMoverLasFichasDelOtroJugador

	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@1).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@2).
	
	self should: [terniLapilli moverFichaXdesde: 1@3 a: 2@1.] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La ficha no pertenece al jugador'] .
	
	terniLapilli moverFichaXdesde: 1@1 a: 1@2.
	
	self should: [terniLapilli moverFichaOdesde: 1@2 a: 1@1.] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La ficha no pertenece al jugador'] .
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:11:57'!
test14pedirElGanadorAunaPartidaNoTerminadaGeneraExcepcion
	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	self should: [terniLapilli ganador] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La partida aun no termino'] .

	terniLapilli ponerFichaXenPosicion: (1@1).
	
	self should: [terniLapilli ganador] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La partida aun no termino'] .
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	self should: [terniLapilli ganador] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La partida aun no termino'] .

	terniLapilli ponerFichaXenPosicion: (3@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@2).
	
	self should: [terniLapilli ganador] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'La partida aun no termino'] .

	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:02:33'!
test15noSePuedenColocarMasFichasCuandoElTableroEstaCompleto
	
	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@1).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	terniLapilli ponerFichaXenPosicion: (2@1).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli ponerFichaXenPosicion: (3@2).
	
	terniLapilli  ponerFichaOenPosicion: (2@2).
	
	self should: [terniLapilli  ponerFichaXenPosicion: (1@2)] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'El jugador x ya puso todas sus fichas'] .

	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:06:44'!
test16noSePuedenMoverFichasHastaQueElTableroNoEsteCompleto	
	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (1@1).
	
	terniLapilli  ponerFichaOenPosicion: (1@3).
	
	self should: [terniLapilli  moverFichaXdesde: 1@1 a: 2@1 ] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'El jugador x no puso todas las fichas todavía'] .

	terniLapilli ponerFichaXenPosicion: (2@1).
	
	self should: [terniLapilli  moverFichaOdesde: 1@3 a: 2@2 ] raise: Error  withExceptionDo: [ :anError | self assert: anError messageText equals: 'El jugador o no puso todas las fichas todavía'] .
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:29:20'!
test17cuandoUnJugadorCompleta3EnRayaTerminaElJuegoYeseJugadorEsElGanador	
	
	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@1).
	
	terniLapilli ponerFichaXenPosicion: (1@3).
	
	terniLapilli  ponerFichaOenPosicion: (3@1).
	
	terniLapilli ponerFichaXenPosicion: (3@3).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli  moverFichaXdesde: (3@3) a: (3@2).
	
	terniLapilli  moverFichaOdesde: (3@1) a: (2@1).
	
	terniLapilli  moverFichaXdesde: (1@3) a: (1@2).
	
	self assert: terniLapilli ganador equals: 'El jugador X es el ganador'.
	
	
	
	
! !

!TerneLapilliTest methodsFor: 'tests' stamp: 'tj 11/8/2018 15:35:18'!
test18cuandoUnJugadorCompleta3EnRayaTerminaElJuegoYeseJugadorEsElGanador	
	
	|terniLapilli|.
	
	terniLapilli _ TerniLapilli nuevoJuego.
	
	terniLapilli ponerFichaXenPosicion: (2@2).
	
	terniLapilli  ponerFichaOenPosicion: (1@1).
	
	terniLapilli ponerFichaXenPosicion: (1@3).
	
	terniLapilli  ponerFichaOenPosicion: (3@1).
	
	terniLapilli ponerFichaXenPosicion: (3@3).
	
	terniLapilli  ponerFichaOenPosicion: (2@3).
	
	terniLapilli  moverFichaXdesde: (3@3) a: (3@2).
	
	terniLapilli  moverFichaOdesde: (3@1) a: (2@1).
	
	terniLapilli  moverFichaXdesde: (2@2) a: (3@3).
	
	terniLapilli  moverFichaOdesde: (1@1) a: (2@2).
	
	self assert: terniLapilli ganador equals: 'El jugador O es el ganador'.
	
	
	
	
! !
