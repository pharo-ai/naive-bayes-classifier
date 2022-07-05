"
Baseline
"
Class {
	#name : #BaselineOfAINaiveBayesClassifier,
	#superclass : #BaselineOf,
	#category : #BaselineOfAINaiveBayesClassifier
}

{ #category : #baselines }
BaselineOfAINaiveBayesClassifier >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Packages"
		spec
			package: 'AI-NaiveBayesClassifier';
			package: 'AI-NaiveBayesClassifier-Tests' with: [ spec requires: #( 'AI-NaiveBayesClassifier' ) ] ]
]
