#lang racket

(for/list ([i (in-naturals 1)]
      [chapter '("racket" "java" "python")])
  (string-append (number->string i) "." chapter))

; with #:when boolean-expr

(for/list ([i '(1 2 3)]
           [chapter '("racket" "python" "c++")]
           #:when (odd? i))
  (string-append (number->string i) ":" chapter))

; with for*/list

(for*/list ([i '(1 2 3)]
           [chapter '("racket" "python" "c++")]
           #:when (odd? i))
  (string-append (number->string i) ":" chapter))