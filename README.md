# Naive Bayes Classifier

[![Build Status](https://travis-ci.org/olekscode/NaiveBayesClassifier.svg?branch=master)](https://travis-ci.org/olekscode/NaiveBayesClassifier)
[![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/naivebayesclassifier)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/NaiveBayesClassifier/badge.svg?branch=master)](https://coveralls.io/github/olekscode/NaiveBayesClassifier?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/NaiveBayesClassifier/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

This is a simple implementation of a multinomial Naive Bayes classifier in Pharo that can be used for simple spam detection and sentiment analysis.

## Installing
```Smalltalk
Metacello new
  baseline: 'NaiveBayesClassifier';
  repository: 'github://pharo-ai/NaiveBayesClassifier/src';
  load.
```
