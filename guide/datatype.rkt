#lang racket

; numbers
(inexact->exact 0.1)
(sin (/ 1 2))

; large integer computation cost more

(define (sigma f a b)
  (if (= a b)
      0
      (+ (f a) (sigma f (+ 1 a) b))))

(time (sigma (lambda (x) (/ 1 x)) 1 2000))
(time (sigma (lambda (x) (/ 1.0 x)) 1 2000))

(= 1 1.0)
(eqv? 1 1.0)

(= 1/2 0.5)
(= 1/10 0.1)
(inexact->exact 0.1)