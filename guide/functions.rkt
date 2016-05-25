#lang racket

(define (anti-sum lst)
  (apply - 10 lst))

(anti-sum '(1 2 3))

(define (recv-keywords #:mode [sun "sylsaint"])
  (string-append "I am " sun))

(recv-keywords)

;lambda
((lambda (x y) (+ x y))
 1 2)

((lambda x x)
 2 3 4)
((lambda x (car x))
 2 3 4)
(define max-mag (lambda nums
                  (apply max (map magnitude nums))))

(max-mag 2 4 6 7 10 10)

; curried function shorthand
(define (make-add-suffix s)
  (lambda (suffix) (string-append s suffix)))

((make-add-suffix "hello") "!")

; multi values and define-values

(quotient 13 3)
(remainder 13 3)
(quotient/remainder 13 3)

(values 1 3 2)

(define (split-name name)
  (let ([parts (regexp-split " " name)])
    (if (= (length parts) 2)
        (values (list-ref parts 0) (list-ref parts 1))
        (error "not a <first> <last> name"))))

(define-values (first last) (split-name "yonglu sun"))
(string-append first " " last)

(lambda (f)
  (define (log-it what)
    (printf "~a\n" what))
  (log-it "running")
  (f 0)
  (log-it "ending"))

; local bindings, let, let*, letrec

(let ([me "Bob"]
      [myself "sun"]
      [I "yonglu"])
  (string-append me " " myself " " I))

(let ([me "sun"]
      [you "ling"])
  (let ([me you]
        [you me])
    (list me you)))

;sequence
(define (print-triangle height)
  (if (zero? height)
      (void)
      (begin
        (display (make-string height #\*))
        (newline)
        (print-triangle (sub1 height)))))
(print-triangle 10)

; begin0 (begin0 expr ...+) return the result of the first expression
(define (long-times thunk)
  (printf "Start: ~s\n" (current-inexact-milliseconds))
  (begin0
    (thunk)
    (printf "End: ~s\n" (current-inexact-milliseconds))))

(long-times (lambda () (sleep 0.1) 0))
(long-times (lambda () (values 1 2)))

; when and unless
; (when test-expr then-body ...+) #t
; (unless test-expr then-body ...+) #f

(define (print-triangle-unless height)
  (unless (zero? height)
    (display (make-string height #\*))
    (newline)
    (print-triangle-unless (sub1 height))))

(print-triangle-unless 5)

(define (list-names lst)
  (if (null? (cdr lst))
      (printf "~a.\n" (car lst))
      (begin
        (printf "~a, " (car lst))
        (when (null? (cdr (cdr lst)))
          (printf "and "))
        (list-names (cdr lst)))))

(list-names '("red" "blue" "green"))

; assignment: set!  (set! id expr)

(define greeted null)
(define (greet name)
  (set! greeted (cons name greeted))
  (string-append "hello, " name))

(greet "red")
(greet "blue")
(greet "green")
(car greeted)
(newline)

; guidelines for assignment