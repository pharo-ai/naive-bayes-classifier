"
I am a multinomial naive bayes classifier with laplace (add 1) smoothing.
"
Class {
	#name : #NaiveBayesClassifier,
	#superclass : #Object,
	#instVars : [
		'priors',
		'likelihoods',
		'labels'
	],
	#category : #NaiveBayesClassifier
}

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> learnFromFeatures: anArrayOfFeatureVectors withLabels: anArrayOfLabels [
	labels := anArrayOfLabels asSet asArray.
	self learnLabelPriors: anArrayOfLabels.
	self learnLikelihoodsFromFeatures: anArrayOfFeatureVectors withLabels: anArrayOfLabels.
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> learnLabelPriors: anArrayOfLabels [
	priors := anArrayOfLabels asBag valuesAndCounts.
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> learnLikelihoodsFromFeatures: anArrayOfFeatureVectors withLabels: anArrayOfLabels [
	likelihoods := (labels collect: [ :label |
		label -> ((anArrayOfFeatureVectors withIndexSelect: [ :vector :index |
			(anArrayOfLabels at: index) = label ]) sum / anArrayOfLabels size) ]) asDictionary.
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> likelihoodOfFeature: aFeatureIndex given: aLabel [
	"Conditional probability of the document being represented with a feature vectore that contains a feature given that this document is labeled with aLabel"
	^ (likelihoods at: aLabel) at: aFeatureIndex
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> likelihoodOfFeatureVector: aFeatureVector given: aLabel [
	"Conditional probability of the document being represented with aFeatureVectore given that this document is labeled with aLabel"
	^ (1 to: aFeatureVector size) inject: 1 into: [ :prod :i |
		prod * (self likelihoodOfFeature: i given: aLabel) ].
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> likelihoodOfLabel: aLabel given: aFeatureVector [
	^ (self priorOfLabel: aLabel) * (self likelihoodOfFeatureVector: aFeatureVector given: aLabel)
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> predictLabelFor: aFeatureVector [
	| labelLikelihoods |
	
	labelLikelihoods := (labels collect: [ :each |
		each -> (self likelihoodOfLabel: each given: aFeatureVector) ]) asDictionary.
	
	^ labelLikelihoods keyAtValue: labelLikelihoods max.
]

{ #category : #'as yet unclassified' }
NaiveBayesClassifier >> priorOfLabel: aLabel [
	"Prior probability of a label"
	^ priors at: aLabel
]
