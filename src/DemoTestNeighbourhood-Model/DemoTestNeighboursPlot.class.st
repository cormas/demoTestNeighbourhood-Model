"
DemoTestNeighboursPlot is the Cell with various possible shapes
"
Class {
	#name : 'DemoTestNeighboursPlot',
	#superclass : 'CMCell',
	#instVars : [
		'state'
	],
	#category : 'DemoTestNeighbourhood-Model',
	#package : 'DemoTestNeighbourhood-Model'
}

{ #category : 'accessing' }
DemoTestNeighboursPlot >> beNil [

	state := nil
]

{ #category : 'accessing' }
DemoTestNeighboursPlot >> beZero [

	state := 0
]

{ #category : 'control' }
DemoTestNeighboursPlot >> changeNeighbourhood [
	"The cell changes the state of its neighbours (from 1 to 8).
	Note that, by default, the neighbours are ordered anticlockwise, starting from the North cell"

	| i |
	i := 0.
	self neighbourhoodWithNils do: [ :n |
		i := i + 1.
		n ifNotNil: [ n state: i ] ]
]

{ #category : 'initialization' }
DemoTestNeighboursPlot >> initialize [

	super initialize.
	self beNil
]

{ #category : 'pov' }
DemoTestNeighboursPlot >> povFlatTop [

	<pov>
	^ self isFlatTopTriangle
		  ifTrue: [ CMPointOfView color: #green ]
		  ifFalse: [ CMPointOfView color: #red ]
]

{ #category : 'pov' }
DemoTestNeighboursPlot >> povNeighbour [

	<pov>
	state = 0 ifTrue: [
		^ CMPointOfView color: #green ].
	^ state ifNil: [CMPointOfView color: (Color fromHexString: 'F6EABD')
		  ] ifNotNil: [
		  CMPointOfView color:
			  (Color red alpha: state / self spaceModel cardinal) ]
]

{ #category : 'accessing' }
DemoTestNeighboursPlot >> state [

	^ state
]

{ #category : 'accessing' }
DemoTestNeighboursPlot >> state: anObject [

	state := anObject
]
