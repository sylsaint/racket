#lang racket

((lambda (x) x) 10)

((lambda (x) ((lambda(y) y) x)) 10)
((lambda (x) x))