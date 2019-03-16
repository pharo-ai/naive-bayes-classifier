Class {
	#name : #NBCCase2,
	#superclass : #NBCExampleCase,
	#category : #'NaiveBayesClassifier-Tests'
}

{ #category : #accessing }
NBCCase2 >> arrayOfDocuments [
	^ #((I am Sam)
		(Sam I am)
		(I do not like green eggs and ham)).
]

{ #category : #accessing }
NBCCase2 >> arrayOfLabels [
	^ #(spam ham spam)
]

{ #category : #'as yet unclassified' }
NBCCase2 >> documentCountsByLabelAndWord [
	^ {
		'spam' -> {
			'I' -> 2 . 'am' -> 1 . 'Sam' -> 1 . 'do' -> 1 .
			'not' -> 1 . 'like' -> 1 . 'green' -> 1 . 'eggs' -> 1 .
			'and' -> 1 . 'ham' -> 1 } asDictionary .
		'ham' -> {
			'I' -> 1 . 'am' -> 1 . 'Sam' -> 1 . 'do' -> 0 .
			'not' -> 0 . 'like' -> 0 . 'green' -> 0 . 'eggs' -> 0 .
			'and' -> 0 . 'ham' -> 0 } asDictionary
	} asDictionary
]

{ #category : #accessing }
NBCCase2 >> documentLikelihoods [
	^ { 
		'spam' -> { (1/4) . (1/4) . (1/(2 ** 7)) } .
		'ham' -> { 1 . 1 . 0 }
	} asDictionary
]

{ #category : #accessing }
NBCCase2 >> documentPriors [
	^ { (1/2) . (1/2) . (1/(3 * 2 ** 6)) }
]

{ #category : #'as yet unclassified' }
NBCCase2 >> labelCounts [
	^ { 'spam' -> 2 . 'ham' -> 1 } asDictionary
]

{ #category : #'as yet unclassified' }
NBCCase2 >> labelLikelihoods [
	^ {{ 'spam' -> (1/3) . 'ham' -> (2/3) } asDictionary .
		{ 'spam' -> (1/3) . 'ham' -> (2/3) } asDictionary .
		{ 'spam' -> 1 . 'ham' -> 0 } asDictionary }
]

{ #category : #accessing }
NBCCase2 >> labelPriors [
	^ { 'spam' -> (2/3) . 'ham' -> (1/3) } asDictionary
]

{ #category : #accessing }
NBCCase2 >> labels [
	^ #(spam ham) asSet
]

{ #category : #'as yet unclassified' }
NBCCase2 >> predictedLabels [ 
	^ #(ham ham spam)
]

{ #category : #accessing }
NBCCase2 >> vocabulary [
	^ #(I am Sam do not like green eggs and ham) asSet
]

{ #category : #accessing }
NBCCase2 >> wordLikelihoods [
	^ {
		'spam' -> {
			'I' -> 1 . 'am' -> (1/2) . 'Sam' -> (1/2) . 'do' -> (1/2) .
			'not' -> (1/2) . 'like' -> (1/2) . 'green' -> (1/2) . 'eggs' -> (1/2) .
			'and' -> (1/2) . 'ham' -> (1/2) } asDictionary .
		'ham' -> {
			'I' -> 1 . 'am' -> 1 . 'Sam' -> 1 . 'do' -> 0 .
			'not' -> 0 . 'like' -> 0 . 'green' -> 0 . 'eggs' -> 0 .
			'and' -> 0 . 'ham' -> 0 } asDictionary
	} asDictionary
]
