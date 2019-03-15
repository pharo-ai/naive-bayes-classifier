Class {
	#name : #NBCExampleCase,
	#superclass : #Object,
	#instVars : [
		'arrayOfDocuments',
		'arrayOfLabels',
		'vocabulary',
		'labels',
		'labelPriors',
		'documentPriors',
		'wordLikelihoods',
		'documentLikelihoods'
	],
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #accessing }
NBCExampleCase >> arrayOfDocuments [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> arrayOfLabels [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> documentLikelihoods [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> documentPriors [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> labelPriors [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> labels [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> vocabulary [
	self subclassResponsibility
]

{ #category : #accessing }
NBCExampleCase >> wordLikelihoods [
	self subclassResponsibility
]
