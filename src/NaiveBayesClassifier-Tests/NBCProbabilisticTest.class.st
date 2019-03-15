Class {
	#name : #NBCProbabilisticTest,
	#superclass : #TestCase,
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #'as yet unclassified' }
NBCProbabilisticTest >> areLabelPriorsProbabilityDistribution: exampleCase [
	"Checks if the label priors form a probability distribution"
	^ self isProbabilityDistribution: exampleCase labelPriors asArray.
]

{ #category : #'as yet unclassified' }
NBCProbabilisticTest >> isProbabilityDistribution: anArray [
	"Checks if the values of anArray form a discrete probability distribution. If they are all in range [0,1] and sum up to 1"
	anArray detect: [ :x | x < 0 or: [ x > 1 ] ] ifFound: [ ^ false ].
	^ anArray sum = 1
]
