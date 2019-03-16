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
	exampleCase := NBCCase2 new.
	
	classifier := NaiveBayesClassifier new.
	classifier vocabulary: exampleCase vocabulary.
	classifier labels: exampleCase labels.
]

{ #category : #tests }
NaiveBayesClassifierTest >> testDocumentCountByLabelAndWordInWithLabels [
	| expected actual |
	expected := exampleCase documentCountsByLabelAndWord.
	
	actual := classifier
		documentCountByLabelAndWordIn: exampleCase arrayOfDocuments
		withLabels: exampleCase arrayOfLabels.
		
	self assert: actual equals: expected 
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
	
	expected := exampleCase labelPriors.
	actual := classifier frequencyOfLabels: exampleCase arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #tests }
NaiveBayesClassifierTest >> testLabelCount [
	| expected actual |
	expected := exampleCase labelCounts.
	actual := classifier labelCount: exampleCase arrayOfLabels.
	self assert: actual equals: expected 
]

{ #category : #tests }
NaiveBayesClassifierTest >> testLikelihoodByLabelAndWordInWithLabels [
	| expected actual |
	
	expected := exampleCase wordLikelihoods.
	
	actual := classifier
		likelihoodByLabelAndWordIn: exampleCase arrayOfDocuments
		withLabels: exampleCase arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #initialization }
NaiveBayesClassifierTest >> testPredictLabelFor [
	| newClassifier expected actual |
	newClassifier := NaiveBayesClassifier new.
	
	newClassifier
		learnFromDocuments: exampleCase arrayOfDocuments
		withLabels: exampleCase arrayOfLabels.
		
	expected := exampleCase predictedLabels.
		
	actual := exampleCase arrayOfDocuments collect: [ :document |
		newClassifier predictLabelFor: document ].
	
	self assert: actual equals: expected.
]
