"
DemoTestNeighboursModel is a simple model which enables to set various grid shapes and visualy tests their neigbourhoods
"
Class {
	#name : 'DemoTestNeighboursModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'thePlots',
		'closedGrid'
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

{ #category : 'accessing' }
DemoTestNeighboursModel >> closedGrid [

	^ closedGrid
]

{ #category : 'accessing' }
DemoTestNeighboursModel >> closedGrid: aBoolean [

	closedGrid := aBoolean
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace3 [
	"Creates the grid with triangular cells.
	Note that the first Cell Is Flat-Top Triangle. To get a first Cell with pointy-Top Triangle, change the fist instruction as:
	CMSpaceModel firstCellIsFlatTopTriangle: true"

	<init>
	CMSpaceModel firstCellIsFlatTopTriangle: false.
	self
		createGridNumberOfRows: 6
		numberOfColumns: 11
		neighbourhood: 3
		closed: closedGrid.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace4 [
	"Creates the grid with rectangular cells with 4 neighbours"

	<init>
	self
		createGridNumberOfRows: 7
		numberOfColumns: 7
		neighbourhood: 4
		closed: closedGrid.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace6 [
	"Creates the grid with hexagonal cells.
	Note that the cells are Flat-Top Hexagons. To get pointy-Top Hexagons, change the first instruction as:
	CMSpaceModel flatTopHexagons: false."

	<init>
	CMSpaceModel flatTopHexagons: true.
	self
		createGridNumberOfRows: 5
		numberOfColumns: 7
		neighbourhood: 6 
		closed: closedGrid.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initSpace8 [
	"Creates the grid with rectangular cells with 8 neighbours"

	<init>
	self
		createGridNumberOfRows: 7
		numberOfColumns: 7
		neighbourhood: 8
		closed: closedGrid.
	DemoTestNeighboursPlot activePovSelector: #povNeighbour
]

{ #category : 'initialization' }
DemoTestNeighboursModel >> initialize [

	super initialize.

	thePlots := OrderedCollection new.
	closedGrid := false
]

{ #category : 'control' }
DemoTestNeighboursModel >> stepCheckNeighbours: t [

	<control>
	| i |
	self cells do: [ :c | c beNil ].
	i := TCMMath number: t onCycle: self cells size.
	(self cells at: i) beZero.
	(self cells at: i) changeNeighbourhood
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
