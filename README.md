# Naive Bayes Classifier

[![Build status](https://github.com/pharo-ai/NaiveBayesClassifier/workflows/CI/badge.svg)](https://github.com/pharo-ai/NaiveBayesClassifier/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/naive-bayes-classifier/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/naive-bayes-classifier?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/NaiveBayesClassifier/master/LICENSE)

This is a simple implementation of a multinomial Naive Bayes classifier in Pharo that can be used for simple spam detection and sentiment analysis.

## Installing
```Smalltalk
Metacello new
  baseline: 'AINaiveBayesClassifier';
  repository: 'github://pharo-ai/NaiveBayesClassifier/src';
  load.
```






```st
"Principal Component Analysis"
"Initializing PolyMath Matrix"
polyMathMatrix := PMMatrix rows: data.
pca := PMPrincipalComponentAnalyserSVD new.

"Reduce to 2 dimensions"
pca componentsNumber: 2.
"Fit the algorithm"
pca fit: polyMathMatrix.

"Transform the matrix"
principalComponents := pca transform: polyMathMatrix.
"Get the principal components"
firstPrincipalComponent := principalComponents rows collect: [ :each | each first].
secondPrincipalComponent := principalComponents rows collect: [ :each | each second].
```
