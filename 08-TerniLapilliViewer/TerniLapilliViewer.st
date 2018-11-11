!classDefinition: #TerniLapilliViewerTest category: #TerniLapilliViewer!
TestCase subclass: #TerniLapilliViewerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliViewer'!

!TerniLapilliViewerTest methodsFor: 'as yet unclassified' stamp: 'mf 11/8/2018 19:48:59'!
test01TerniLapilliViewerShowsWhenMarking

	|terniLapilliLog result|

	terniLapilliLog _ TerniLapilliViewer new.

	result _ terniLapilliLog markWithXAt: (2@2).
	
	self assert: result equals: 'X marcó en 2@2
Estado: Jugando O'.! !


!classDefinition: #TerniLapilliViewer category: #TerniLapilliViewer!
Object subclass: #TerniLapilliViewer
	instanceVariableNames: 'terniLapilli state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliViewer'!

!TerniLapilliViewer methodsFor: 'as yet unclassified' stamp: 'mf 11/8/2018 19:56:12'!
initialize
	terniLapilli _ TerniLapilli new.! !

!TerniLapilliViewer methodsFor: 'as yet unclassified' stamp: 'mf 11/8/2018 19:55:02'!
markWithXAt: aPoint  
	|mark|
	terniLapilli markWithXAt: aPoint.
	mark _ 'X marcó en '.
	state _ mark, aPoint.! !
