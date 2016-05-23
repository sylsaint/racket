#lang racket

(display #\A)
(display #\u03BB)

(char-alphabetic? #\A)
(char-numeric? #\0)
(char-whitespace? #\space)
(char-downcase #\A)
(char-upcase #\a)

;char comparison
(char=? #\a #\A)
(char-ci=? #\a #\A)
(eqv? #\a #\A)