"
I am a multinomial naive bayes classifier with laplace (add 1) smoothing.
"
Class {
	#name : #NaiveBayesClassifier,
	#superclass : #Object,
	#instVars : [
		'vocabulary',
		'labels',
		'priors',
		'likelihoods'
	],
	#category : #NaiveBayesClassifier
}

{ #category : #learning }
NaiveBayesClassifier >> documentCountByLabelAndWordIn: anArrayOfDocuments withLabels: anArrayOfLabels [
	| zeroCounts selectedIndices selectedDocuments result |
	
	zeroCounts := (vocabulary collect: [ :each | each -> 0 ]) asDictionary.
	result := Dictionary new.
	
	labels do: [ :label |
		selectedIndices := (1 to: anArrayOfLabels size)
			select: [ :i | (anArrayOfLabels at: i) = label ].
			
		selectedDocuments := selectedIndices
			collect: [ :i | anArrayOfDocuments at: i ].
			
		result at: label put: (
			zeroCounts union: (selectedDocuments flatCollect: #asSet) asBag valuesAndCounts) ].
		
		^ result
]

{ #category : #learning }
NaiveBayesClassifier >> extractVocabularyFrom: anArrayOfDocuments [
	^ anArrayOfDocuments flatCollectAsSet: #value.
]

{ #category : #learning }
NaiveBayesClassifier >> frequencyOfLabels: anArrayOfLabels [
	^ (self labelCount: anArrayOfLabels) / anArrayOfLabels size.
]

{ #category : #learning }
NaiveBayesClassifier >> labelCount: anArrayOfLabels [
	^ anArrayOfLabels asBag valuesAndCounts
]

{ #category : #accessing }
NaiveBayesClassifier >> labels [
	^ labels
]

{ #category : #accessing }
NaiveBayesClassifier >> labels: anObject [
	labels := anObject
]

{ #category : #learning }
NaiveBayesClassifier >> learnFromDocuments: anArrayOfDocuments withLabels: anArrayOfLabels [
	vocabulary := self extractVocabularyFrom: anArrayOfDocuments.
	labels := anArrayOfLabels asSet asArray.
	
	self learnLabelPriors: anArrayOfLabels.
	self learnLikelihoodsFrom: anArrayOfDocuments withLabels: anArrayOfLabels.
]

{ #category : #learning }
NaiveBayesClassifier >> learnLabelPriors: anArrayOfLabels [
	priors := self frequencyOfLabels: anArrayOfLabels.
]

{ #category : #learning }
NaiveBayesClassifier >> learnLikelihoodsFrom: anArrayOfDocuments withLabels: anArrayOfLabels [
	likelihoods := self likelihoodByLabelAndWordIn: anArrayOfDocuments withLabels: anArrayOfLabels
]

{ #category : #learning }
NaiveBayesClassifier >> likelihoodByLabelAndWordIn: anArrayOfDocuments withLabels: anArrayOfLabels [
	| documentCountsByLabelAndWord labelCounts result |
	
	documentCountsByLabelAndWord := self
		documentCountByLabelAndWordIn: anArrayOfDocuments
		withLabels: anArrayOfLabels.
		
	labelCounts := self labelCount: anArrayOfLabels.
		
	result := Dictionary new.
		
	labels do: [ :label |
		result at: label put: Dictionary new.
		
		vocabulary do: [ :word |
			(result at: label) at: word put: (
				((documentCountsByLabelAndWord at: label) at: word) / (labelCounts at: label)) ] ].
		
	^ result 
]

{ #category : #predicting }
NaiveBayesClassifier >> likelihoodOfDocument: aDocument givenLabel: aLabel [
	"Conditional probability of aDocument (treated as a bag of words) given that this document is labeled with aLabel. This probability is based on the Naive Bayes assumption"
	^ aDocument inject: 1 into: [ :prod :word |
		prod * (self likelihoodOfWord: word givenLabel: aLabel) ].
]

{ #category : #predicting }
NaiveBayesClassifier >> likelihoodOfLabel: aLabel givenDocument: aDocument [
	^ (self priorOfLabel: aLabel) * (self likelihoodOfDocument: aDocument givenLabel: aLabel)
]

{ #category : #predicting }
NaiveBayesClassifier >> likelihoodOfWord: aWord givenLabel: aLabel [
	"Conditional probability that aWord appears in the document given that this document is labeled with aLabel"
	^ (likelihoods at: aLabel) at: aWord
]

{ #category : #accessing }
NaiveBayesClassifier >> likelihoods [
	^ likelihoods
]

{ #category : #accessing }
NaiveBayesClassifier >> likelihoods: anObject [
	likelihoods := anObject
]

{ #category : #predicting }
NaiveBayesClassifier >> predictLabelFor: aDocument [
	"Assigns label to aDocument which has the maximum likelihood given that document"
	| document labelLikelihoods |
	
	document := self removeOutOfVocabularyWords: aDocument.
	
	labelLikelihoods := (labels collect: [ :each |
		each -> (self likelihoodOfLabel: each givenDocument: document) ]) asDictionary.
	
	^ labelLikelihoods keyAtValue: labelLikelihoods max.
]

{ #category : #predicting }
NaiveBayesClassifier >> priorOfLabel: aLabel [
	"Prior probability of a label"
	^ priors at: aLabel
]

{ #category : #accessing }
NaiveBayesClassifier >> priors [
	^ priors
]

{ #category : #accessing }
NaiveBayesClassifier >> priors: anObject [
	priors := anObject
]

{ #category : #predicting }
NaiveBayesClassifier >> removeOutOfVocabularyWords: aDocument [
	^ aDocument select: [ :word | self vocabulary includes: word ]
]

{ #category : #accessing }
NaiveBayesClassifier >> vocabulary [
	^ vocabulary
]

{ #category : #accessing }
NaiveBayesClassifier >> vocabulary: anObject [
	vocabulary := anObject
]
