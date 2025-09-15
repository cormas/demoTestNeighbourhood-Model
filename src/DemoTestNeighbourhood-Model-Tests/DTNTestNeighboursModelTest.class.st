"
A DTNTestNeighboursModelTest is a test class for testing the behavior of DTNTestNeighboursModel
"
Class {
	#name : 'DTNTestNeighboursModelTest',
	#superclass : 'TestCase',
	#category : 'DemoTestNeighbourhood-Model-Tests',
	#package : 'DemoTestNeighbourhood-Model-Tests'
}

{ #category : 'tests' }
DTNTestNeighboursModelTest >> testInitSpace3 [

	| m |
	m := DemoTestNeighboursModel new
		     initSpace3;
		     yourself.
	self
		assert: (m cellAt: 8)
		identicalTo: (m selectCellsOfColumn: 1) second
]

{ #category : 'tests' }
DTNTestNeighboursModelTest >> testInitSpace3EastNeighbours [

	| m targetCell |
	m := DemoTestNeighboursModel new
		     initSpace3;
		     yourself.
	targetCell	:= (m cellAt: 2).
	self
		assert: (targetCell neighbourhood first)
		identicalTo: (m cellAt: 1).
	self
		assert: (targetCell neighbourhood at: 2)
		identicalTo: (m cellAt: 14).
	self
		assert: (targetCell neighbourhood last)
		identicalTo: (m cellAt: 9).
]

{ #category : 'tests' }
DTNTestNeighboursModelTest >> testInitSpace4 [

	| m |
	m := DemoTestNeighboursModel new
		     initSpace4;
		     yourself.
	self
		assert: (m cellAt: 8)
		identicalTo: (m selectCellsOfColumn: 1) second
]

{ #category : 'tests' }
DTNTestNeighboursModelTest >> testInitSpace6 [

	| m |
	m := DemoTestNeighboursModel new
		     initSpace6;
		     yourself.
	self
		assert: (m cellAt: 8)
		identicalTo: (m selectCellsOfColumn: 1) second
]

{ #category : 'tests' }
DTNTestNeighboursModelTest >> testInitSpace8 [

	| m |
	m := DemoTestNeighboursModel new
		     initSpace8;
		     yourself.
	self
		assert: (m cellAt: 8)
		identicalTo: (m selectCellsOfColumn: 1) second
]

{ #category : 'tests' }
DTNTestNeighboursModelTest >> testStepCheckNeighbours [

	| m i |
	m := DemoTestNeighboursModel new
		     initSpace6;
		     yourself.
	i := 1.
	8 timesRepeat: [m stepCheckNeighbours: i. i := i + 1].
	self
		assert: ((m cellAt: i - 1) neighbourhood at: 5)
		identicalTo: (m selectCellsOfColumn: 2) second
]
