#lang racket

(define cat "Hello Kitty")

(module zoo racket
  (provide tiger)
  (define tiger "Tony"))

(module* animal #f
  (provide cat))

(require 'zoo)
(display tiger)
(newline)