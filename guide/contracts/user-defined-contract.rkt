#lang racket

(define (amount? i)
  (and (number? i) (integer? i) (exact? i) (>= i 0)))

; Every function that accepts one argument can be treated as a predicate and thus used as a contract
(define amount/c
  (and/c number? integer? exact? (or/c positive? zero?)))

(provide (contract-out [deposit (-> amount/c any)]
                   [amount? (-> any/c boolean?)]
                   [balance (-> amount/c)]))

(define amount 0)
(define (deposit m)
  (set! amount (+ amount m)))
(define (balance) amount)

; creating strings from bank records
(define (has-decimal? m)
  (define L (string-length m))
  (char=? #\. (string-ref m (- L 3))))

(provide (contract-out [format-number (-> number? string?)]
                       [format-nat (-> natural-number/c (and/c string? #rx"[0-9]*\\.[0-9][0-9]"))]))

(define (format-number m)
  (number->string m))

(define (format-nat m)
  (real->decimal-string m))

(define (digit-char? x)
  (member x '(#\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\0)))

(define (is-decimal-string? m)
  (define L (string-length m))
  (and (has-decimal? m)
       (andmap digit-char?
               (string->list (substring m 0 (- L 3))))
       (andmap digit-char?
               (string->list (substring m (- L 2) L)))))