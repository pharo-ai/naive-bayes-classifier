Class {
	#name : #NaiveBayesClassifierTest,
	#superclass : #TestCase,
	#instVars : [
		'exampleCase',
		'classifier'
	],
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #initialization }
NaiveBayesClassifierTest >> setUp [
	super setUp.
	exampleCase := NBCCase1 new.
	
	classifier := NaiveBayesClassifier new.
	classifier vocabulary: exampleCase vocabulary.
	classifier labels: exampleCase labels.
]

{ #category : #tests }
NaiveBayesClassifierTest >> testExtractVocabularyFrom [
	| expected actual |
	
	expected := exampleCase vocabulary.
	actual := classifier extractVocabularyFrom: exampleCase arrayOfDocuments.
	
	self assert: actual equals: expected
	
]

{ #category : #tests }
NaiveBayesClassifierTest >> testFrequencyOfLabels [
	| expected actual |
	
	expected := { 'spam' -> (2/3) . 'ham' -> (1/3) } asDictionary.
	actual := classifier frequencyOfLabels: arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #tests }
NaiveBayesClassifierTest >> testLikelihoodByLabelAndWordInWithLabels [
	| expected actual |
	
	expected := {
		'spam' -> {
			'I' -> (3/21) . 'am' -> (2/21) . 'Sam' -> (2/21) . 'do' -> (2/21) .
			'not' -> (2/21) . 'like' -> (2/21) . 'green' -> (2/21) . 'eggs' -> (2/21) .
			'and' -> (2/21) . 'ham' -> (2/21) } asDictionary .
		'ham' -> {
			'I' -> (2/13) . 'am' -> (2/13) . 'Sam' -> (2/13) . 'do' -> (1/13) .
			'not' -> (1/13) . 'like' -> (1/13) . 'green' -> (1/13) . 'eggs' -> (1/13) .
			'and' -> (1/13) . 'ham' -> (1/13) } asDictionary
	} asDictionary.
	
	actual := classifier
		likelihoodByLabelAndWordIn: arrayOfDocuments
		withLabels: arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #initialization }
NaiveBayesClassifierTest >> testPredictLabelFor [
	| newClassifier label |
	newClassifier := NaiveBayesClassifier new.
	newClassifier learnFromDocuments: arrayOfDocuments withLabels: arrayOfLabels.
	label := newClassifier predictLabelFor: arrayOfDocuments first.
	self assert: label equals: #spam.
]

{ #category : #tests }
NaiveBayesClassifierTest >> testWordCountByLabelAndWordInWithLabels [
	| expected actual |
	
	expected := {
		'spam' -> {
			'I' -> 2 . 'am' -> 1 . 'Sam' -> 1 . 'do' -> 1 .
			'not' -> 1 . 'like' -> 1 . 'green' -> 1 . 'eggs' -> 1 .
			'and' -> 1 . 'ham' -> 1 } asDictionary .
		'ham' -> {
			'I' -> 1 . 'am' -> 1 . 'Sam' -> 1 . 'do' -> 0 .
			'not' -> 0 . 'like' -> 0 . 'green' -> 0 . 'eggs' -> 0 .
			'and' -> 0 . 'ham' -> 0 } asDictionary
	} asDictionary.
	
	actual := classifier
		wordCountByLabelAndWordIn: arrayOfDocuments
		withLabels: arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #tests }
NaiveBayesClassifierTest >> testWordCountByLabelInWithLabels [
	| expected actual |
	
	expected := { 'spam' -> 11 . 'ham' -> 3 } asDictionary.
	actual := classifier wordCountByLabelIn: arrayOfDocuments withLabels: arrayOfLabels.
	
	self assert: actual equals: expected
]
