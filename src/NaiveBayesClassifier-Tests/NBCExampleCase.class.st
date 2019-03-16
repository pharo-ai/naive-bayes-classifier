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

{ #category : #'as yet unclassified' }
NBCExampleCase >> documentCountsByLabelAndWord [
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

{ #category : #'as yet unclassified' }
NBCExampleCase >> labelCounts [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
NBCExampleCase >> labelLikelihoods [
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

{ #category : #'as yet unclassified' }
NBCExampleCase >> predictedLabels [
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
