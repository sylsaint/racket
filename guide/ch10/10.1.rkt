#lang racket

; catch up exceptions, with-handlers
; (with-handlers ([predicate-expr handler-expr] ...)
;  body ...+)

(with-handlers ([exn:fail:contract:divide-by-zero? (lambda(exn) +inf.0)])
  (/ 1 0))

; The error function is one way to raise your own exception. It packages an error message and other information into an exn:fail structure

; (error "oops")

(with-handlers ([exn:fail? (lambda (exn) 'air-bag)])
  (error "crash"))

; Multiple predicate-exprs in a with-handlers form let you handle different kinds of exceptions in different ways.
; The raise function lets you raise any value as an exception

(define (always-fail n)
  (with-handlers ([even? (lambda (v) 'even)]
                  [odd? (lambda (v) 'odd)])
    (raise n)))

(always-fail 10)
(always-fail 9)

