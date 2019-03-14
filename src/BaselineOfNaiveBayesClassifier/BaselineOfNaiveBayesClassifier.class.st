Class {
	#name : #BaselineOfNaiveBayesClassifier,
	#superclass : #BaselineOf,
	#category : #BaselineOfNaiveBayesClassifier
}

{ #category : #baselines }
BaselineOfNaiveBayesClassifier >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		"Packages"
		spec
			package: 'NaiveBayesClassifier';
			package: 'NaiveBayesClassifier' with: [ spec requires: #('NaiveBayesClassifier') ].
	]
]
