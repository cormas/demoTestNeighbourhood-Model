"
DemoTestNeighboursModel is a simple model which enables to set various grid shapes and visualy tests their neigbourhoods
"
Class {
	#name : 'DemoTestNeighboursModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'thePlots'
	],
	#category : 'DemoTestNeighbourhood-Model',
	#package : 'DemoTestNeighbourhood-Model'
}

{ #category : 'as yet unclassified' }
DemoTestNeighboursModel class >> aboutThisModel [

	^ ''
]

{ #category : 'as yet unclassified' }
DemoTestNeighboursModel class >> prefix [

	^ 'DTN'
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace3 [
	"Creates the grid with triangular cells.
	Note that the first Cell Is Flat-Top Triangle. To get a first Cell with pointy-Top Triangle, change the fist instruction as:
	CMSpaceModel firstCellIsFlatTopTriangle: true"

	<init>
	CMSpaceModel firstCellIsFlatTopTriangle: false.
	self
		createGridNumberOfRows: 5
		numberOfColumns: 7
		neighbourhood: 3
		closed: false.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace4 [
	"Creates the grid with rectangular cells with 4 neighbours"

	<init>
	self
		createGridNumberOfRows: 5
		numberOfColumns: 7
		neighbourhood: 4
		closed: false.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace6 [
	"Creates the grid with hexagonal cells.
	Note that the cells are Flat-Top Hexagons. To get pointy-Top Hexagons, change the first instruction as:
	CMSpaceModel flatTopHexagons: false."

	<init>
	CMSpaceModel flatTopHexagons: false.
	self
		createGridNumberOfRows: 5
		numberOfColumns: 7
		neighbourhood: 6
		closed: false.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace8 [
	"Creates the grid with rectangular cells with 8 neighbours"

	<init>
	self
		createGridNumberOfRows: 5
		numberOfColumns: 7
		neighbourhood: 8
		closed: false.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initialize [

	super initialize.

	thePlots := OrderedCollection new.
]

{ #category : 'control' }
DemoTestNeighboursModel >> stepCheckNeighbours: t [

	<control>
	| i |
	self thePlots do: [ :c | c beNil ].
	i := TCMMath number: t onCycle: self thePlots size.
	(self thePlots at: i) beZero.
	(self thePlots at: i) changeNeighbourhood
]

{ #category : 'accessing' }
DemoTestNeighboursModel >> thePlots [

	<getterFor: #DemoTestNeighboursPlot>
	^ thePlots
]

{ #category : 'accessing' }
DemoTestNeighboursModel >> thePlots: anObject [

	thePlots := anObject
]
