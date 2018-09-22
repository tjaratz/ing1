!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 15:55:10'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
		
	self assertThat:  [customerBook addCustomerNamed: 'John Lennon'] takesLessThan: 50 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 15:55:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
		
	customerBook addCustomerNamed: 'Paul McCartney'.
	  
	self assertThat:  [customerBook removeCustomerNamed: 'Paul McCartney'] takesLessThan: 100 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 15:55:30'!
test03CanNotAddACustomerWithEmptyName 

	self onExecuting: [customerBook addCustomerNamed: ''] itFailsWith: Error asserting: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 15:55:42'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self onExecuting: [ customerBook removeCustomerNamed: 'Paul McCartney'.] itFailsWith: NotFound  asserting: [ 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 16:42:08'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	self addAndSuspend: 'Paul McCartney'.
	
	self assertActiveCustomersAre: 0 suspendedCustomersAre: 1 andTotalCustomersAre: 1 .
	
	"mi intención con esto era escribir algo como 'and: 'assert' paulIsInThere.' usando el objeto Compiler, pero no llegué a ver bien cómo funciona y me tiraba error, así que seguí de largo"
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 16:41:37'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self addAndSuspend: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assertActiveCustomersAre: 0 suspendedCustomersAre: 0 andTotalCustomersAre: 0.
	
	"mi intención con esto era escribir algo como 'and: 'deny' paulIsInThere.' usando el objeto Compiler, pero no llegué a ver bien cómo funciona y me tiraba error, así que seguí de largo"
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 16:57:44'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self attemptAndFailToSuspendInABookWithJohnLennon: 'Paul McCartney'.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mf 9/22/2018 16:57:44'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	self addAndSuspend: 'John Lennon'.
	
	self attemptAndFailToSuspendInABookWithJohnLennon: 'John Lennon'.! !


!CustomerBookTest methodsFor: 'util' stamp: 'mf 9/22/2018 16:56:15'!
addAndSuspend: customerName
	
	customerBook addCustomerNamed: customerName.
	customerBook suspendCustomerNamed: customerName.! !

!CustomerBookTest methodsFor: 'util' stamp: 'mf 9/22/2018 16:08:03'!
assertActiveCustomersAre: activeToCheck suspendedCustomersAre: suspendedToCheck andTotalCustomersAre: totalToCheck
	
	| |
	self assert: activeToCheck equals: customerBook numberOfActiveCustomers.
	self assert: suspendedToCheck equals: customerBook numberOfSuspendedCustomers.
	self assert: totalToCheck equals: customerBook numberOfCustomers.
"	self deny: (customerBook includesCustomerNamed: paulMcCartney)."


"test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
!!!!	paulMcCartney := 'Paul McCartney'.
	
!!!!	customerBook addCustomerNamed: paulMcCartney.
!!!!	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
#	self assert: 0 equals: customerBook numberOfActiveCustomers.
#	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
#	self assert: 0 equals: customerBook numberOfCustomers.
#!!	self deny: (customerBook includesCustomerNamed: paulMcCartney)."
	
"test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

!!!!	| customerBook paulMcCartney|
!!!!	paulMcCartney := 'Paul McCartney'.
	
!!!!	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
#	self assert: 0 equals: customerBook numberOfActiveCustomers.
#	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
#	self assert: 1 equals: customerBook numberOfCustomers.
#!!	self assert: (customerBook includesCustomerNamed: paulMcCartney)."
	
! !

!CustomerBookTest methodsFor: 'util' stamp: 'tj 9/20/2018 21:15:12'!
assertThat: aClosureToMeasure takesLessThan: aNumberOfMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning|
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosureToMeasure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aNumberOfMilliseconds )
	
! !

!CustomerBookTest methodsFor: 'util' stamp: 'mf 9/22/2018 16:57:44'!
attemptAndFailToSuspendInABookWithJohnLennon: aCustomerThatCannot

	[ customerBook suspendCustomerNamed: aCustomerThatCannot .
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon' ) ]


"test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
#!!	[ customerBook suspendCustomerNamed: 'Paul McCartney'.
!!!!	self fail ]
!!!!		on: CantSuspend 
!!!!		do: [ :anError | 
!!!!			self assert: customerBook numberOfCustomers = 1.
!!!!			self assert: (customerBook includesCustomerNamed: johnLennon) ]"

"test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |

	self addAndSuspend: 'John Lennon'.
	
#!!	[ customerBook suspendCustomerNamed: johnLennon.
!!!!	self fail ]
!!!!		on: CantSuspend 
!!!!		do: [ :anError | 
!!!!			self assert: customerBook numberOfCustomers = 1.
!!!!			self assert: (customerBook includesCustomerNamed: johnLennon) ]"
! !

!CustomerBookTest methodsFor: 'util' stamp: 'mf 9/22/2018 15:59:24'!
onExecuting: aClosureThatShouldFail itFailsWith: anErrorToBeVerified asserting: aClosureWithPostconditionsOnCustomerBook
	
	[ aClosureThatShouldFail value.
	self fail ]
		on: anErrorToBeVerified 
		do: (aClosureWithPostconditionsOnCustomerBook).! !

!CustomerBookTest methodsFor: 'util' stamp: 'mf 9/22/2018 15:54:43'!
setUp
	customerBook _ CustomerBook new.! !


!CustomerBookTest methodsFor: 'trash' stamp: 'mf 9/22/2018 16:24:52'!
assertActiveCustomersAre: activeToCheck suspendedCustomersAre: suspendedToCheck andTotalCustomersAre: totalToCheck xx: messageToSelf
	
	"Habría que ver cómo hacer para parametrizar ese 'assert' que puede ser un 'deny' "
	
	| |
	self assert: activeToCheck equals: customerBook numberOfActiveCustomers.
	self assert: suspendedToCheck equals: customerBook numberOfSuspendedCustomers.
	self assert: totalToCheck equals: customerBook numberOfCustomers.
	Compiler evaluate: (messageToSelf, ': (customerBook includesCustomerNamed ''Paul McCartney'')') for: self logged: false.
	"self messageToSelf." "(customerBook includesCustomerNamed: 'Paul McCartney')."

"test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
!!!!	paulMcCartney := 'Paul McCartney'.
	
!!!!	customerBook addCustomerNamed: paulMcCartney.
!!!!	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
#	self assert: 0 equals: customerBook numberOfActiveCustomers.
#	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
#	self assert: 0 equals: customerBook numberOfCustomers.
#!!	self deny: (customerBook includesCustomerNamed: paulMcCartney)."
	
"test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

!!!!	| customerBook paulMcCartney|
!!!!	paulMcCartney := 'Paul McCartney'.
	
!!!!	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
#	self assert: 0 equals: customerBook numberOfActiveCustomers.
#	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
#	self assert: 1 equals: customerBook numberOfCustomers.
#!!	self assert: (customerBook includesCustomerNamed: paulMcCartney)."
	
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers suspended'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:28'!
includesCustomerNamed: aName

	^(customers includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:38'!
isEmpty
	
	^customers isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NicolasRinaldi 9/16/2018 21:55:33'!
initialize

	super initialize.
	customers := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'HAW 9/19/2018 08:41:11'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((customers includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:57'!
numberOfActiveCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NicolasRinaldi 9/16/2018 22:01:43'!
numberOfCustomers
	
	^customers size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'mf 9/22/2018 17:03:30'!
remove: aName from: container

	1 to: container size do: 
	[ :index |
		aName = (container at: index)
			ifTrue: [
				container removeAt: index.
				^ aName 
			] 
	].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 9/19/2018 08:41:50'!
removeCustomerNamed: aName 
 
	1 to: customers size do: 
	[ :index |
		aName = (customers at: index)
			ifTrue: [
				customers removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:27:55'!
suspendCustomerNamed: aName 
	
	(customers includes: aName) ifFalse: [^CantSuspend signal].
	
	customers remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
