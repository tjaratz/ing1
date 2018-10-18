!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'tj 10/18/2018 13:07:53'!
representativeValue
	
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'tj 10/18/2018 13:08:46'!
representativeValue
	
	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'tj 10/18/2018 13:08:29'!
representativeValue
	
	^ value * -1! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #SummarizingAccount category: #'Portfolio-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'balance' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'accounts' stamp: 'tj 10/18/2018 13:01:42'!
accountsOf

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'tj 10/17/2018 23:07:10'!
balance

	^ accounts sum: [:accountOrPortofolio | accountOrPortofolio balance]! !


!Portfolio methodsFor: 'testing' stamp: 'tj 10/17/2018 23:22:26'!
doesManage: anAccount

		self = anAccount ifTrue: [^ true].

		accounts do:[:anAccountOrPortofolio | (anAccountOrPortofolio doesManage: anAccount ) ifTrue: [^ true] ].
		
		^ false.
! !

!Portfolio methodsFor: 'testing' stamp: 'tj 10/17/2018 23:16:17'!
hasRegistered: aTransaction
	
	accounts do:[:anAccountOrPortofolio | (anAccountOrPortofolio hasRegistered: aTransaction) ifTrue: [^ true] ].
	
	^ false.! !


!Portfolio methodsFor: 'transactions' stamp: 'tj 10/18/2018 12:34:11'!
add: anAccount

     |acounts|.

	accounts ifNil: [accounts := Set new].
	
	acounts _ anAccount  accountsOf .
	
	(acounts) do: [:anotherAccount | (self doesManage: anotherAccount) ifTrue:[self error: self class accountAlreadyManagedErrorMessage ]].
		
	accounts add: anAccount.
	
	^ self.
	
	! !

!Portfolio methodsFor: 'transactions' stamp: 'tj 10/18/2018 12:41:12'!
initializeWith: aCollectionOfAccounts

	aCollectionOfAccounts do: [:anAccount | self add: anAccount ].

	! !

!Portfolio methodsFor: 'transactions' stamp: 'tj 10/18/2018 00:08:13'!
initializeWith: leftAccount with: rightAccount
	
	self add: leftAccount.
	
	self add: rightAccount .
		
	^self.! !

!Portfolio methodsFor: 'transactions' stamp: 'tj 10/18/2018 12:22:33'!
transactions 

	|transactions|.
	
	transactions _ Set new.
	
	 accounts do:
		[:anAccount | anAccount transactions do: [:aTransaction | transactions add: aTransaction ]].
		
	^ transactions .	
		
		! !

!Portfolio methodsFor: 'transactions' stamp: 'tj 10/18/2018 12:42:05'!
transactionsOf: anAccount 

	|account|.
	
	 account _ accounts detect: [:anotherAccount | anotherAccount doesManage: anAccount ] 
								ifNone: [^ self error: self class accountNotManagedMessageDescription ].
	
	^ account transactions.! !


!Portfolio methodsFor: 'accounts' stamp: 'tj 10/18/2018 12:21:39'!
accountsOf
	
	|managedAccounts|
	
	managedAccounts _ Set new.
	
	accounts do: [:anAccount | managedAccounts addAll: anAccount accountsOf].
	
	^ managedAccounts.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'tj 10/18/2018 12:54:22'!
with: leftAccount with: rightAccount

	|accounts|.
	
	accounts _ OrderedCollection with: leftAccount with: rightAccount .

	^ self withAll: accounts .
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'tj 10/18/2018 12:29:29'!
withAll: aCollectionOfAccounts

	^ self new initializeWith: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:43'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:53'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'tj 10/18/2018 12:42:51'!
initialize

	super initialize.
	
	transactions := Set new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'tj 10/18/2018 13:10:21'!
balance

	^ transactions sum: [:transaction | transaction  representativeValue ] ifEmpty: 0.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'tj 10/18/2018 12:42:40'!
doesManage: anAccount

	^ self = anAccount .
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'accounts' stamp: 'tj 10/18/2018 12:38:31'!
accountsOf

	|managedAccounts|.
	
	managedAccounts _ Set new.
	
	managedAccounts add: self.
	
	^ managedAccounts.! !
