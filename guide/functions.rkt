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
