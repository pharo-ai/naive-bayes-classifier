Class {
	#name : #NaiveBayesClassifierTest,
	#superclass : #TestCase,
	#instVars : [
		'featureVectors',
		'labels'
	],
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #initialization }
NaiveBayesClassifierTest >> setUp [
	featureVectors := #(
		(0 0 0 1 1 0 1)
		(1 0 0 1 0 0 0)
		(0 0 0 1 0 0 1)
		(0 1 0 0 1 1 0)).
		
	labels := #(a b c b).
]

{ #category : #initialization }
NaiveBayesClassifierTest >> testLearnFromFeaturesWithLabels [
	| classifier |
	classifier := NaiveBayesClassifier new.
	classifier learnFromFeatures: featureVectors withLabels: labels.
]

{ #category : #initialization }
NaiveBayesClassifierTest >> testPredictLabelFor [
	| classifier label |
	classifier := NaiveBayesClassifier new.
	classifier learnFromFeatures: featureVectors withLabels: labels.
	label := classifier predictLabelFor: featureVectors first.
	self assert: label equals: #a.
]
