Class {
	#name : #NBCCase1Test,
	#superclass : #NBCProbabilisticTest,
	#instVars : [
		'exampleCase'
	],
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #running }
NBCCase1Test >> setUp [ 
	exampleCase := NBCCase1 new.
]

{ #category : #tests }
NBCCase1Test >> testAreLabelPriorsProbabilityDistribution [
	self assert: (self areLabelPriorsProbabilityDistribution: exampleCase)
]
