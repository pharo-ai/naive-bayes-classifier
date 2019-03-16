Class {
	#name : #NBCCase1,
	#superclass : #NBCExampleCase,
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #initialization }
NBCCase1 >> arrayOfDocuments [
	^ #((I am Sam)
		(Sam I am)
		(I do not like green eggs and ham)).
]

{ #category : #initialization }
NBCCase1 >> arrayOfLabels [
	^ #(spam spam ham)
]

{ #category : #'as yet unclassified' }
NBCCase1 >> documentCountsByLabelAndWord [
	^ {
		'spam' -> {
			'I' -> 2 . 'am' -> 2 . 'Sam' -> 2 . 'do' -> 0 .
			'not' -> 0 . 'like' -> 0 . 'green' -> 0 . 'eggs' -> 0 .
			'and' -> 0 . 'ham' -> 0 } asDictionary .
		'ham' -> {
			'I' -> 1 . 'am' -> 0 . 'Sam' -> 0 . 'do' -> 1 .
			'not' -> 1 . 'like' -> 1 . 'green' -> 1 . 'eggs' -> 1 .
			'and' -> 1 . 'ham' -> 1 } asDictionary
	} asDictionary
]

{ #category : #initialization }
NBCCase1 >> documentLikelihoods [
	^ { 
		'spam' -> { 1 . 1 . 0 } .
		'ham' -> { 0 . 0 . 1 }
	} asDictionary
]

{ #category : #initialization }
NBCCase1 >> documentPriors [
	^ { (2/3) . (2/3) . (1/3) }
]

{ #category : #'as yet unclassified' }
NBCCase1 >> labelCounts [
	^ { 'spam' -> 2 . 'ham' -> 1 } asDictionary
]

{ #category : #'as yet unclassified' }
NBCCase1 >> labelLikelihoods [
	^ {{ 'spam' -> 1 . 'ham' -> 0 } asDictionary .
		{ 'spam' -> 1 . 'ham' -> 0 } asDictionary .
		{ 'spam' -> 0 . 'ham' -> 1 } asDictionary }
]

{ #category : #initialization }
NBCCase1 >> labelPriors [
	^ { 'spam' -> (2/3) . 'ham' -> (1/3) } asDictionary
]

{ #category : #initialization }
NBCCase1 >> labels [
	^ #(spam ham) asSet
]

{ #category : #'as yet unclassified' }
NBCCase1 >> predictedLabels [ 
	^ #(spam spam ham)
]

{ #category : #initialization }
NBCCase1 >> vocabulary [
	^ #(I am Sam do not like green eggs and ham) asSet
]

{ #category : #initialization }
NBCCase1 >> wordLikelihoods [
	^ {
		'spam' -> {
			'I' -> 1 . 'am' -> 1 . 'Sam' -> 1 . 'do' -> 0 .
			'not' -> 0 . 'like' -> 0 . 'green' -> 0 . 'eggs' -> 0 .
			'and' -> 0 . 'ham' -> 0 } asDictionary .
		'ham' -> {
			'I' -> 1 . 'am' -> 0 . 'Sam' -> 0 . 'do' -> 1 .
			'not' -> 1 . 'like' -> 1 . 'green' -> 1 . 'eggs' -> 1 .
			'and' -> 1 . 'ham' -> 1 } asDictionary
	} asDictionary
]
