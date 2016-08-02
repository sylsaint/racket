#lang racket

; The for/first form returns the result of the first time that the bodys are evaluated,
; skipping further iterations. This form is most useful with a #:when clause

(for/first ([chapter '("python" "scheme" "racket")]
            #:when (not (equal? chapter "python")))
  chapter)

; The for/last form runs all iterations, returning the value of the last iteration (or #f if no iterations are run)

(for/last ([i '(1 2 3)]
           #:when (not (equal? i 3)))
  i)