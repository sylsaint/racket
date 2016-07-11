#lang racket

; 7.6 Abstract Contracts using #:exists and #:∃

; The contract system provides existential contracts that can protect abstractions,
; ensuring that clients of your module cannot depend on the precise representation
; choices you make for your data structures.

(define empty '())
(define (enq top queue) (append queue (list top)))
(define (next queue) (car queue))
(define (deq queue) (cdr queue))
(define (empty? queue) (null? queue))

(provide (contract-out
          #:exists queue
          [empty (listof integer?)]
          [enq (-> integer? (listof integer?) (listof integer?))]
          [next (-> (listof integer?) integer?)]
          [deq (-> (listof integer?) (listof integer?))]
          [empty? (-> (listof integer?) boolean?)]))
          