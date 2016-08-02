#lang racket

(require math/bigfloat)

(bf-precision 2)

(define remain_money 50)
(define remain_size 6)

(define (round-off n a)
  (let ([m (expt 10 a)])
    (/ (round (* n m)) m)))

(define (get_random_pocket money size lst)
  (cond [(= size 1) (cons (round-off money 2) lst)]
        [else (let*
                  ([minium 0.01]
                   [maxium (* 2 (/ money size))]
                   [pocket (round-off (* maxium (random)) 2)]
                   [dicrease (- size 1)])
                (cond [(and (= pocket minium) (< pocket minium)) (get_random_pocket (- money minium) dicrease (cons minium lst))]
                      [else (get_random_pocket (- money pocket) dicrease (cons pocket lst))]))]))

(define (random_pocket money size)
  (let ([lst '()])
    (get_random_pocket money size lst)))
(displayln (random_pocket remain_money remain_size))
(define (sum lst)
  (sum-recursive lst 0))

(define (sum-recursive lst sum)
  (cond [(null? lst) sum]
        [else (sum-recursive (cdr lst) (+ (car lst) sum))]))