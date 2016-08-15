#lang racket

; s represents stack
; pop means pop element from stack
; push means push element into stack

(define stack '())

(define (pop s)
  (cond [(not (null? s)) (set! stack (cdr s)) (car s)]
        [else (displayln "stack is empty!")]))

(define (push s e)
  (set! stack (cons e s)))

(push stack 1)
(push stack 2)
(push stack "hello")

(pop stack)
(pop stack)
(pop stack)