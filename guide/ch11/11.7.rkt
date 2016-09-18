#lang racket

; for/fold and for*/fold

; (for/fold ([accum-id init-expr] ...)
;         (clause ...)
; body ...+)

(for/fold ([prev #f])
          ([i '(1 2 3)]
           [chapter '("context" "free" "grammar" "grammar")]
           #:when (not (equal? chapter prev)))
  (printf "~a.~a\n" i chapter)
  chapter)

; When multiple accum-ids are specified, then the last body must produce multiple values, one for each accum-id.

(for/fold ([prev #f]
           [index #f])
          ([i '(1 2 3)]
           [chapter '("context" "free" "grammar" "grammar")]
           #:when (not (equal? chapter prev)))
  (printf "~a.~a\n" i chapter)
  (values chapter i))