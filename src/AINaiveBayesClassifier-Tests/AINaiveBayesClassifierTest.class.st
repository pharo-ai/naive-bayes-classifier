Class {
	#name : #AINaiveBayesClassifierTest,
	#superclass : #TestCase,
	#instVars : [
		'exampleCase',
		'classifier'
	],
	#category : #'AINaiveBayesClassifier-Tests'
}

{ #category : #running }
AINaiveBayesClassifierTest >> setUp [
	super setUp.
	exampleCase := NBCCase2 new.
	
	classifier := AINaiveBayesClassifier new.
	classifier vocabulary: exampleCase vocabulary.
	classifier labels: exampleCase labels.
]

{ #category : #tests }
AINaiveBayesClassifierTest >> testDocumentCountByLabelAndWordInWithLabels [
	| expected actual |
	expected := exampleCase documentCountsByLabelAndWord.
	
	actual := classifier
		documentCountByLabelAndWordIn: exampleCase arrayOfDocuments
		withLabels: exampleCase arrayOfLabels.
		
	self assert: actual equals: expected 
]

{ #category : #tests }
AINaiveBayesClassifierTest >> testExtractVocabularyFrom [
	| expected actual |
	
	expected := exampleCase vocabulary.
	actual := classifier extractVocabularyFrom: exampleCase arrayOfDocuments.
	
	self assert: actual equals: expected
	
]

{ #category : #tests }
AINaiveBayesClassifierTest >> testFrequencyOfLabels [
	| expected actual |
	
	expected := exampleCase labelPriors.
	actual := classifier frequencyOfLabels: exampleCase arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #tests }
AINaiveBayesClassifierTest >> testLabelCount [
	| expected actual |
	expected := exampleCase labelCounts.
	actual := classifier labelCount: exampleCase arrayOfLabels.
	self assert: actual equals: expected 
]

{ #category : #tests }
AINaiveBayesClassifierTest >> testLikelihoodByLabelAndWordInWithLabels [
	| expected actual |
	
	expected := exampleCase wordLikelihoods.
	
	actual := classifier
		likelihoodByLabelAndWordIn: exampleCase arrayOfDocuments
		withLabels: exampleCase arrayOfLabels.
	
	self assert: actual equals: expected
]

{ #category : #initialization }
AINaiveBayesClassifierTest >> testPredictLabelFor [
	| newClassifier expected actual |
	newClassifier := AINaiveBayesClassifier new.
	
	newClassifier
		learnFromDocuments: exampleCase arrayOfDocuments
		withLabels: exampleCase arrayOfLabels.
		
	expected := exampleCase predictedLabels.
		
	actual := exampleCase arrayOfDocuments collect: [ :document |
		newClassifier predictLabelFor: document ].
	
	self assert: actual equals: expected.
]
