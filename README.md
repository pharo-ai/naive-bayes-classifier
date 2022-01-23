# Naive Bayes Classifier

[![Build status](https://github.com/pharo-ai/NaiveBayesClassifier/workflows/CI/badge.svg)](https://github.com/pharo-ai/NaiveBayesClassifier/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/NaiveBayesClassifier/badge.svg?branch=master)](https://coveralls.io/github/olekscode/NaiveBayesClassifier?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/NaiveBayesClassifier/master/LICENSE)

This is a simple implementation of a multinomial Naive Bayes classifier in Pharo that can be used for simple spam detection and sentiment analysis.

## Installing
```Smalltalk
Metacello new
  baseline: 'NaiveBayesClassifier';
  repository: 'github://pharo-ai/NaiveBayesClassifier/src';
  load.
```
