#lang racket

(define (double i)
  ((if (string? i) string-append +) i i))

(double 20)

(define (twice f v)
  (f (f v)))

(twice (lambda (s) (string-append s "!?")) "abc")

(define (converse s)
  (define (start? s2)
    (define len2 (string-length s2))
    (and (>= (string-length s) len2)
         (equal? s2 (substring s 0 len2))))
  (cond [(start? "hello") "hello"]
        [(start? "goodbye") "bye"]
        [else "huh?"]))

(converse "hellow, baby")

(let ([x (random 5)]
      [o (random 5)])
  (cond [(> x o) "x wins"]
        [(> o x) "o wins"]
        [else "draw"]))

(let* ([x (random 5)]
      [o (random 5)]
      [diff (number->string (abs (- x o)))])
  (cond [(> x o) (string-append "x wins by " diff)]
        [(> o x) (string-append "o wins by " diff)]
        [else "draw"]))

(define (reverse-string s)
  (define (reverse s o)
    (cond [(string? s) (let* ([len (string-length s)]
                              [sub (if (> len 0) (substring s 0 (- len 1)) s)]
                              [last (if (> len 0) (substring s (- len 1) len) s)])
                         (if (equal? sub "") (string-append o last) (reverse sub (string-append o last))))]
          [(number? s) (let ([x (number->string s)]) (reverse x o))]
          [else ("please input string or number")]))
  (reverse s ""))

(reverse-string 12.726)

