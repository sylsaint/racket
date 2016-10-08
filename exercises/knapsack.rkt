#lang racket

(require math/array)

; recursive solution

(define (max a b) (if (> a b) a b))

(define (knapsack wt vt n W)
  (cond [(or (= n 0) (= W 0)) 0]
        [(> (list-ref wt (- n 1)) W) (knapsack wt vt (- n 1) W)]
        [else (max (+ (list-ref vt (- n 1)) (knapsack wt vt (- n 1) (- W (list-ref wt (- n 1))))) (knapsack wt vt (- n 1) W))]))

(define wt '(20 50 90 45))
(define vt '(100 200 499 300))
(define n 4)
(define W 100)
(displayln (knapsack wt vt 4 W))


; dp solution

(define ds #(W n))
(displayln ds)
(define wmatrix (make-array #(W n) 0))
(displayln wmatrix)