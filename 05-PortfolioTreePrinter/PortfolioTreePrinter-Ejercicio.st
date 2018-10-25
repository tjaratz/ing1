!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 18:48:48'!
affectBalance: currentBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'tj 10/22/2018 18:06:57'!
accept: aVisitor

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:00'!
affectBalance: currentBalance

	^currentBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'visitors' stamp: 'tj 10/22/2018 18:07:19'!
accept: aVisitor

	aVisitor visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 19:41'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Investment category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Investment
	instanceVariableNames: 'capital period tna'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Investment methodsFor: 'evaluating' stamp: 'tj 10/21/2018 16:58:09'!
affectBalance: currentBalance

	^ currentBalance - capital.! !

!Investment methodsFor: 'evaluating' stamp: 'tj 10/21/2018 17:01:49'!
capital

	^ capital .! !

!Investment methodsFor: 'evaluating' stamp: 'tj 10/21/2018 17:05:17'!
earnings

	^ capital * ( (tna / 360) * period).! !

!Investment methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:33:52'!
period

	^period! !

!Investment methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:34:06'!
tna

	^tna! !


!Investment methodsFor: 'visitors' stamp: 'tj 10/23/2018 10:02:58'!
accept: aVisitor

	aVisitor visitInvestment: self.! !


!Investment methodsFor: 'initialize' stamp: 'tj 10/21/2018 16:56:50'!
initializeFor: anAmount during: aNumberOfDays at: aTna

	capital _ anAmount .
	
	period _ aNumberOfDays .
	
	tna _ aTna .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Investment class' category: #'PortfolioTreePrinter-Ejercicio'!
Investment class
	instanceVariableNames: ''!

!Investment class methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 16:55:58'!
for: anAmount during: aNumberOfDays at: aTna

	^ self new initializeFor: anAmount during: aNumberOfDays at: aTna.! !

!Investment class methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 16:57:32'!
registerOf: anAmount during: aNumberODays at: aTna on: anAccount

	|investment|.

	investment _ self for: anAmount during: aNumberODays at: aTna.
	
	anAccount register: investment .
	
	^ investment .
	! !


!classDefinition: #TransferenceLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferenceLeg
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferenceLeg methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 15:48:15'!
initializeFor: anAmount over: aTransfer
	
	value _ anAmount .
	
	transfer _ aTransfer .
	! !

!TransferenceLeg methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 15:44:20'!
transfer
	
	^ transfer! !


!classDefinition: #IncomingTransference category: #'PortfolioTreePrinter-Ejercicio'!
TransferenceLeg subclass: #IncomingTransference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!IncomingTransference methodsFor: 'evaluating' stamp: 'tj 10/18/2018 19:27:32'!
affectBalance: currentBalance

	^currentBalance + value! !

!IncomingTransference methodsFor: 'evaluating' stamp: 'tj 10/18/2018 19:56:39'!
value

	^ value.! !


!IncomingTransference methodsFor: 'visitors' stamp: 'tj 10/23/2018 10:03:50'!
accept: aVisitor

	aVisitor visitIncomingTransference: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IncomingTransference class' category: #'PortfolioTreePrinter-Ejercicio'!
IncomingTransference class
	instanceVariableNames: ''!

!IncomingTransference class methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 15:27:44'!
for: anAmount over: aTransfer

	^ self new initializeFor: anAmount over: aTransfer 
	
	! !


!classDefinition: #OutcomingTransference category: #'PortfolioTreePrinter-Ejercicio'!
TransferenceLeg subclass: #OutcomingTransference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!OutcomingTransference methodsFor: 'evaluating' stamp: 'tj 10/18/2018 19:27:41'!
affectBalance: currentBalance

	^currentBalance - value! !

!OutcomingTransference methodsFor: 'evaluating' stamp: 'tj 10/18/2018 19:56:29'!
value

	^ value.! !


!OutcomingTransference methodsFor: 'visitors' stamp: 'tj 10/23/2018 10:04:04'!
accept: aVisitor

	aVisitor visitOutcomingTransference: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OutcomingTransference class' category: #'PortfolioTreePrinter-Ejercicio'!
OutcomingTransference class
	instanceVariableNames: ''!

!OutcomingTransference class methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 15:27:53'!
for: anAmount over: aTransfer

	^ self new initializeFor: anAmount over: aTransfer 
	! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:08'!
affectBalance: currentBalance

	^currentBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !


!Withdraw methodsFor: 'visitors' stamp: 'tj 10/23/2018 10:03:18'!
accept: aVisitor

	aVisitor visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:32'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #AccountVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountVisitor methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:17:04'!
value

	self subclassResponsibility ! !

!AccountVisitor methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:17:28'!
visitDeposit: aDeposit

	self subclassResponsibility ! !

!AccountVisitor methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:17:42'!
visitIncomingTransference: anIncomingTransference

	self subclassResponsibility 
	! !

!AccountVisitor methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:19:34'!
visitInvestment:  anInvestment
	
	self subclassResponsibility 
	! !

!AccountVisitor methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:18:05'!
visitOutcomingTransference: anOutcomingTransference

	self subclassResponsibility 
	! !

!AccountVisitor methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:19:21'!
visitWithdraw: aWithdraw
	
	self subclassResponsibility 
	! !


!classDefinition: #AccountInvestment category: #'PortfolioTreePrinter-Ejercicio'!
AccountVisitor subclass: #AccountInvestment
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:39:57'!
initializeOf: anAccount
	
	account _ anAccount .! !

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:40:06'!
value
		
	self subclassResponsibility 
! !

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:26:40'!
visitDeposit: aDeposit! !

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:27:17'!
visitIncomingTransference: anIncomingTransference

	! !

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:38:04'!
visitInvestment: anInvestment

	self subclassResponsibility 

	! !

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:27:38'!
visitOutcomingTransference: anOutcomingTransference

	! !

!AccountInvestment methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:26:53'!
visitWithdraw: aWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestment class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestment class
	instanceVariableNames: ''!

!AccountInvestment class methodsFor: 'as yet unclassified' stamp: 'tj 10/25/2018 15:29:27'!
of: anAccount

	^ self new initializeOf: anAccount .! !


!classDefinition: #AccountInvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestment subclass: #AccountInvestmentEarnings
	instanceVariableNames: 'investmentEarnings'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentEarnings methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:56:47'!
value

	investmentEarnings _ 0.

	account visitTransactionsWith: self.
	
	^ investmentEarnings  ! !

!AccountInvestmentEarnings methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:56:08'!
visitInvestment: anInvestment

	investmentEarnings _ investmentEarnings + (anInvestment earnings).! !


!classDefinition: #AccountInvestmentNet category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestment subclass: #AccountInvestmentNet
	instanceVariableNames: 'value withdrawalLeg depositLeg lines investmentNetValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentNet methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:47:43'!
value

	investmentNetValue _ 0.

	account visitTransactionsWith: self.
	
	^ investmentNetValue .! !

!AccountInvestmentNet methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:46:53'!
visitInvestment: anInvestment

	investmentNetValue _ investmentNetValue + (anInvestment capital)! !


!classDefinition: #AccountSummaryLines category: #'PortfolioTreePrinter-Ejercicio'!
AccountVisitor subclass: #AccountSummaryLines
	instanceVariableNames: 'account lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:30:17'!
initializeOf: aReceptiveAccount

     lines _ OrderedCollection new.

	account _ aReceptiveAccount.! !

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:30:08'!
value
	
	account visitTransactionsWith: self.
	
	^ lines.! !

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/23/2018 09:59:26'!
visitDeposit: aDeposit

	lines add: 'Deposito por ', aDeposit value asString.
	
	! !

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:01:17'!
visitIncomingTransference: anIncomingTransference

	lines add: 'Transferencia por ', anIncomingTransference value asString.
	
	! !

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:34:53'!
visitInvestment: anInvestment

	lines addLast: 'Plazo fijo por ', anInvestment capital asString, ' durante ', anInvestment period asString, ' dias a una tna de ', anInvestment tna denominator asString, '%'! !

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:01:42'!
visitOutcomingTransference: anOutcomingTransference

	lines add: 'Transferencia por -', anOutcomingTransference value asString.
	
	! !

!AccountSummaryLines methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:00:21'!
visitWithdraw: aWithdraw

	lines add: 'Extraccion por ', aWithdraw value asString.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryLines class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummaryLines class
	instanceVariableNames: ''!

!AccountSummaryLines class methodsFor: 'as yet unclassified' stamp: 'tj 10/22/2018 17:45:06'!
of: aReceptiveAccount

	^ self new initializeOf: aReceptiveAccount .! !


!classDefinition: #AccountTransferNetOf category: #'PortfolioTreePrinter-Ejercicio'!
AccountVisitor subclass: #AccountTransferNetOf
	instanceVariableNames: 'account transferNetSum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:30:38'!
initializeOf: aReceptiveAccount

	transferNetSum _ 0.

	account _ aReceptiveAccount.! !

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/25/2018 15:31:21'!
value
	
	account visitTransactionsWith: self.
		
	^ transferNetSum.! !

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:27:34'!
visitDeposit: aDeposit

	
	! !

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:23:36'!
visitIncomingTransference: anIncomingTransference

	transferNetSum _ anIncomingTransference affectBalance: transferNetSum .
	
	! !

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:27:41'!
visitInvestment: anInvestment

! !

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:23:41'!
visitOutcomingTransference: anOutcomingTransference

	transferNetSum _ anOutcomingTransference affectBalance: transferNetSum .
	
	! !

!AccountTransferNetOf methodsFor: 'evaluating' stamp: 'tj 10/23/2018 10:27:45'!
visitWithdraw: aWithdraw

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNetOf class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNetOf class
	instanceVariableNames: ''!

!AccountTransferNetOf class methodsFor: 'as yet unclassified' stamp: 'tj 10/23/2018 10:22:51'!
of: aReceptiveAccount

	^ self new initializeOf: aReceptiveAccount .! !


!classDefinition: #AccountTreePrinter category: #'PortfolioTreePrinter-Ejercicio'!
AccountVisitor subclass: #AccountTreePrinter
	instanceVariableNames: 'account lines names nestedLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTreePrinter methodsFor: 'evaluating' stamp: 'tj 10/24/2018 12:28:47'!
getNestedSpaceFor: aNestedLevel

	|nestedSpace|.

	nestedSpace _ ''.
	
     1 to: aNestedLevel do:[:anINdex | nestedSpace _ nestedSpace, ' '].

	^ nestedSpace .

	! !

!AccountTreePrinter methodsFor: 'evaluating' stamp: 'tj 10/25/2018 16:39:56'!
initializeOf: anAccount with: accountNames

	nestedLevel _ 0.

	names _ accountNames .

	account _ anAccount.
	
	lines _ OrderedCollection new.
	
	! !

!AccountTreePrinter methodsFor: 'evaluating' stamp: 'tj 10/24/2018 11:37:06'!
value
	
	account accept: self.
	
	^ lines .
! !

!AccountTreePrinter methodsFor: 'evaluating' stamp: 'tj 10/25/2018 16:43:57'!
visitAccount: anAccount

	|nestedSpace|.
	
	nestedSpace _ self getNestedSpaceFor: nestedLevel.

	lines addLast: (nestedSpace, (names at: anAccount )).


	! !

!AccountTreePrinter methodsFor: 'evaluating' stamp: 'tj 10/25/2018 16:49:02'!
visitPortofolio: aPortofolio

	|nestedSpace|.
	
	nestedSpace _ self getNestedSpaceFor: nestedLevel.
	
	nestedLevel _ nestedLevel + 1.

	lines addLast: (nestedSpace, (names at: aPortofolio )).
		
	aPortofolio visitAccountsWith: self.
	
	nestedLevel _ nestedLevel -1 .
	
	

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTreePrinter class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTreePrinter class
	instanceVariableNames: ''!

!AccountTreePrinter class methodsFor: 'as yet unclassified' stamp: 'tj 10/23/2018 11:31:39'!
of: aReceptiveAccount

	^ self new initializeOf: aReceptiveAccount .! !

!AccountTreePrinter class methodsFor: 'as yet unclassified' stamp: 'tj 10/24/2018 11:36:30'!
of: aReceptiveAccount with: names

	^ self new initializeOf: aReceptiveAccount with: names .
	
	! !


!classDefinition: #AccountReverseTreePrinter category: #'PortfolioTreePrinter-Ejercicio'!
AccountTreePrinter subclass: #AccountReverseTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountReverseTreePrinter methodsFor: 'evaluating' stamp: 'tj 10/24/2018 15:04:05'!
value

	^ super value reverse! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'visitors' stamp: 'tj 10/25/2018 15:59:34'!
accept: aVisitor

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount doesManage: anAccount) or: [ anAccount doesManage: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 10/18/2018 16:31:24'!
transactionsOf: anAccount 

	^ (self doesManage: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialize' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !


!Portfolio methodsFor: 'visitors' stamp: 'tj 10/25/2018 16:16:29'!
accept: aVisitor

	aVisitor visitPortofolio: self.! !

!Portfolio methodsFor: 'visitors' stamp: 'tj 10/25/2018 16:48:40'!
visitAccountsWith: aVisitor

	accounts do: [:anAccount | anAccount accept: aVisitor ].! !


!Portfolio methodsFor: 'accesing' stamp: 'tj 10/24/2018 11:38:24'!
accounts

	^ accounts ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HAW 10/18/2018 16:31:24'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount doesManage: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 10/18/2018 18:49:23'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'tj 10/18/2018 19:11:00'!
transfer: anAmount to: anAccount
	
	! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'tj 10/22/2018 17:30:01'!
transferences

	|transferences|.
		
	transferences _ transactions select: [:aTransaction | aTransaction isKindOf: TransferenceLeg].
	
	^ transferences .! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'visitors' stamp: 'tj 10/23/2018 11:34:06'!
accept: aVisitor

	aVisitor visitAccount: self.! !

!ReceptiveAccount methodsFor: 'visitors' stamp: 'tj 10/25/2018 09:10:10'!
visitTransactionsWith: aVisitor

	transactions do: [:aTransaction | aTransaction  accept: aVisitor].! !


!classDefinition: #Transference category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdrawalLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transference methodsFor: 'initialize' stamp: 'tj 10/21/2018 15:25:12'!
initializeFor: anAmount

	value _ anAmount.
	
	depositLeg _ IncomingTransference for: anAmount over: self.
	
	withdrawalLeg _ OutcomingTransference for: anAmount over: self.	
	! !


!Transference methodsFor: 'accessing' stamp: 'tj 10/21/2018 15:32:08'!
depositLeg
	
	^ depositLeg ! !

!Transference methodsFor: 'accessing' stamp: 'tj 10/18/2018 20:03:35'!
value

	^ value. ! !

!Transference methodsFor: 'accessing' stamp: 'tj 10/25/2018 16:13:34'!
withdrawLeg
	
	^ withdrawalLeg ! !

!Transference methodsFor: 'accessing' stamp: 'tj 10/25/2018 16:13:01'!
withdrawalLeg
	
	^ withdrawalLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: #'PortfolioTreePrinter-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 15:18:53'!
of: anAmount
	
 	^ self new initializeFor: anAmount! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'tj 10/21/2018 15:34:37'!
register: anAmount from: anAccount to: anotherAccount

	| transfer|.

	transfer _ self of: anAmount .
	
	anAccount  register: transfer withdrawalLeg.
	anotherAccount register: transfer depositLeg.
	
	^ transfer.

	

	
	
	
	! !
