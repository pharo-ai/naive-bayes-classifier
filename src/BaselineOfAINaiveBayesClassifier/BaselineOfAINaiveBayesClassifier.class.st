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
			package: 'AINaiveBayesClassifier';
			package: 'AINaiveBayesClassifier-Tests' with: [ spec requires: #( 'AINaiveBayesClassifier' ) ] ]
]
