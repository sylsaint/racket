#lang racket

; The for/and form combines iteration results with and
(for/and ([chapter '("scheme" "lisp" "julia")])
  (equal? chapter "scheme"))

; The for/or form combines iteration results with or

(for/or ([i '(1 2 3)])
  (even? i))