#lang racket

(provide (contract-out [amount (and/c number? positive?)]))

(define amount 25)

(define/contract accum (and/c number? positive?) 150)

(+ amount accum)

(provide (contract-out [deposit (number? . -> . any)]
                       [balance (-> number?)]))

(define (deposit m)
  (set! amount (+ m amount)))

(define (balance) amount)


; A -> by itself is not a contract; it is a contract combinator, which combines other contracts to form a contract.

; 7.2.3 any and any/c

; The any/c contract is similar to any, in that it makes no demands on a value. Unlike any,
; any/c indicates a single value, and it is suitable for use as an argument contract

(provide (contract-out [f (-> number? any/c)]))

(define (f x)
  (values (+ x 1) (- x 1)))

; 7.2.4 Rolling Your Own Contracts

; 7.2.6 Contract Messages with “tempN”

(module bank-server racket
  (provide (contract-out [deposit (-> (lambda (x) (and (number? x) (integer? x) (>= x 0))) any)]))
  (define total 0)
  (define (deposit x) (set! total (+ total x))))

(require 'bank-server)
(deposit -10)