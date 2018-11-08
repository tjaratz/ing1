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


!TerniLapilli methodsFor: 'inicializacion' stamp: 'tj 11/7/2018 18:01:48'!
initialize
	
	celdasDeX _ OrderedCollection new.
	
	celdasDeO _ OrderedCollection  new.
	
	estado _ TurnoDePonerFichasX .
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

!TerniLapilli class methodsFor: 'inicializacion' stamp: 'tj 11/8/2018 14:13:24'!
nuevoJuego

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


!TerniLapilliEstado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 18:02:45'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self subclassResponsibility ! !

!TerniLapilliEstado class methodsFor: 'jugar' stamp: 'tj 11/8/2018 15:28:48'!
moverFichaPertenecienteA: unConjuntoDeFichasDeUnJugador desde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli 

	(unConjuntoDeFichasDeUnJugador includes: unaCelda ) ifFalse: [self error: self laFichaNoEsDelJugador ].
	
	(unaPartidaDeTerniLapilli laCelda: unaCelda esContiguaA: unaCeldaContigua) ifFalse: [self error: self celdasNoContiguas].
		
	(unaPartidaDeTerniLapilli celdaLibre: unaCeldaContigua ) ifFalse: [self error: (self celdaOcupada: unaCeldaContigua) ].
	
	unConjuntoDeFichasDeUnJugador add: unaCeldaContigua .
	
     unConjuntoDeFichasDeUnJugador remove: unaCelda.

	unaPartidaDeTerniLapilli avanzarAlProximoEstado

	! !

!TerniLapilliEstado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 18:02:50'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self subclassResponsibility ! !

!TerniLapilliEstado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 18:03:10'!
ponerFichaOenPosicion: unaCelda sobre: unaPartidaDeTerniLapilli

	self subclassResponsibility 
	

			! !

!TerniLapilliEstado class methodsFor: 'jugar' stamp: 'tj 11/7/2018 18:03:05'!
ponerFichaXenPosicion: unaCelda sobre: unaPartidaDeTerniLapilli

	self subclassResponsibility 
	

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


!classDefinition: #TurnoDeMoverO category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TurnoDeMoverO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnoDeMoverO class' category: #'TerneLapilli-Ejercicio'!
TurnoDeMoverO class
	instanceVariableNames: ''!

!TurnoDeMoverO class methodsFor: 'estado' stamp: 'tj 11/7/2018 18:01:09'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli estado isKindOf: TurnoDeMoverX class) and: [unaPartidaDeTerniLapilli celdasDeO size = 3].! !

!TurnoDeMoverO class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:45:22'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !


!TurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:50:16'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli
		
		self moverFichaPertenecienteA: unaPartidaDeTerniLapilli celdasDeO desde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli  .! !

!TurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:35:32'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self turnoDeO .! !

!TurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:35:40'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self tableroCompleto .
			! !

!TurnoDeMoverO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:35:35'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self turnoDeO .
			! !


!classDefinition: #TurnoDeMoverX category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TurnoDeMoverX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnoDeMoverX class' category: #'TerneLapilli-Ejercicio'!
TurnoDeMoverX class
	instanceVariableNames: ''!

!TurnoDeMoverX class methodsFor: 'estado' stamp: 'tj 11/7/2018 18:01:30'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ ((unaPartidaDeTerniLapilli estado isKindOf: TurnoDePonerFichasO class) or:[unaPartidaDeTerniLapilli estado isKindOf: TurnoDeMoverO class]) and: [unaPartidaDeTerniLapilli celdasDeX size = 3].! !

!TurnoDeMoverX class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:47:05'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !


!TurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:35:47'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli
		
	self error: self turnoDeX .! !

!TurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:25:24'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli

	self moverFichaPertenecienteA: unaPartidaDeTerniLapilli celdasDeX desde: unaCelda a: unaCeldaContigua en: unaPartidaDeTerniLapilli  .! !

!TurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:35:52'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self turnoDeX .
			
	
			! !

!TurnoDeMoverX class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:35:56'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self tableroCompleto.
			
	
			! !


!classDefinition: #TurnoDePonerFichasO category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TurnoDePonerFichasO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnoDePonerFichasO class' category: #'TerneLapilli-Ejercicio'!
TurnoDePonerFichasO class
	instanceVariableNames: ''!

!TurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:36:13'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self tableroIncompleto .! !

!TurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:36:08'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self turnoDeO .! !

!TurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/7/2018 16:00:27'!
ponerFichaOenPosicion: unaCelda sobre: unaPartidaDeTerniLapilli
		
	self validarPosicionamientoDeUnaFichaEn: unaCelda sobre: unaPartidaDeTerniLapilli .
	
	unaPartidaDeTerniLapilli celdasDeO add: unaCelda .
	
	unaPartidaDeTerniLapilli avanzarAlProximoEstado
			
			
	
			
	! !

!TurnoDePonerFichasO class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:18:04'!
ponerFichaXenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self turnoDeO .
			
	
			! !


!TurnoDePonerFichasO class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:17:39'!
tableroIncompleto

	^ 'El jugador o no puso todas las fichas todavía'! !

!TurnoDePonerFichasO class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:17:35'!
turnoEquivocado

	^ 'El turno corresponde al jugador o'! !


!TurnoDePonerFichasO class methodsFor: 'estado' stamp: 'tj 11/7/2018 18:01:48'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli estado isKindOf: TurnoDePonerFichasX class) .! !

!TurnoDePonerFichasO class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:47:09'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !


!classDefinition: #TurnoDePonerFichasX category: #'TerneLapilli-Ejercicio'!
TerniLapilliEstado subclass: #TurnoDePonerFichasX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerneLapilli-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnoDePonerFichasX class' category: #'TerneLapilli-Ejercicio'!
TurnoDePonerFichasX class
	instanceVariableNames: ''!

!TurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:36:23'!
moverFichaOdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self turnoEquivocado .! !

!TurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/8/2018 14:36:26'!
moverFichaXdesde: unaCelda a: unaCeldaContigua en: unaPartidaTerniLapilli

	self error: self tableroIncompleto.! !

!TurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 16:22:30'!
ponerFichaOenPosicion: aPoint sobre: unaPartidaDeTerniLapilli
	
	self error: self turnoDeX.
			
	
			
	! !

!TurnoDePonerFichasX class methodsFor: 'jugar' stamp: 'tj 11/7/2018 16:00:15'!
ponerFichaXenPosicion: unaCelda sobre: unaPartidaDeTerniLapilli

	self validarPosicionamientoDeUnaFichaEn: unaCelda sobre: unaPartidaDeTerniLapilli .
	
	unaPartidaDeTerniLapilli celdasDeX add: unaCelda .
	
	unaPartidaDeTerniLapilli avanzarAlProximoEstado.
	

			! !


!TurnoDePonerFichasX class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:15:11'!
tableroIncompleto

	^ 'El jugador x no puso todas las fichas todavía'! !

!TurnoDePonerFichasX class methodsFor: 'errores' stamp: 'tj 11/6/2018 17:17:01'!
turnoEquivocado

	^ 'El turno corresponde al jugador x'! !


!TurnoDePonerFichasX class methodsFor: 'estado' stamp: 'tj 11/7/2018 18:01:30'!
esEstadoSiguientePara: unaPartidaDeTerniLapilli

	^ (unaPartidaDeTerniLapilli estado isKindOf: TurnoDePonerFichasO class) and: [unaPartidaDeTerniLapilli celdasDeX size < 3].! !

!TurnoDePonerFichasX class methodsFor: 'estado' stamp: 'tj 11/7/2018 17:47:13'!
ganador: unaPartidaDeTerniLapilli

	self error: self partidaNoTerminada! !
