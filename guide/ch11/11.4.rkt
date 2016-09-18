#lang racket

; for/vector and for*/vector

(for*/vector ([i '(1 2 3)]
             [ln '("scheme" "julia" "c")])
  (string-append (number->string i) "." ln))