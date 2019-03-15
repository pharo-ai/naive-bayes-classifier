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
	^ #(spam ham spam)
]

{ #category : #initialization }
NBCCase1 >> documentLikelihoods [
	^ { 
		'spam' -> {  } .
		'ham' -> {  }
	} asDictionary
]

{ #category : #initialization }
NBCCase1 >> documentPriors [
	^ { (2/3) . (2/3) . (1/3) }
]

{ #category : #initialization }
NBCCase1 >> labelPriors [
	^ { 'spam' -> (2/3) . 'ham' -> (1/3) } asDictionary
]

{ #category : #initialization }
NBCCase1 >> labels [
	^ #(spam ham) asSet
]

{ #category : #initialization }
NBCCase1 >> vocabulary [
	^ #(I am Sam do not like green eggs and ham) asSet
]

{ #category : #initialization }
NBCCase1 >> wordLikelihoods [
	^ {
		'spam' -> {
			'I' -> (2/3) . 'am' -> (1/3) . 'Sam' -> (1/3) . 'do' -> (1/3) .
			'not' -> (1/3) . 'like' -> (1/3) . 'green' -> (1/3) . 'eggs' -> (1/3) .
			'and' -> (1/3) . 'ham' -> (1/3) } asDictionary .
		'ham' -> {
			'I' -> (1/3) . 'am' -> (1/3) . 'Sam' -> (1/3) . 'do' -> 0 .
			'not' -> 0 . 'like' -> 0 . 'green' -> 0 . 'eggs' -> 0 .
			'and' -> 0 . 'ham' -> 0 } asDictionary
	} asDictionary
]
