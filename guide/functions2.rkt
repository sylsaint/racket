#lang racket

(define greet (lambda (#:hi [hi "Hello"] given #:last [surname "Smith"])
                (string-append hi ", " given " " surname)))

(define (trace-wrap f)
  (make-keyword-procedure
   (lambda (kws kw-args . rest)
     (printf "Called with ~s ~s ~s\n" kws kw-args rest)
     (keyword-apply f kws kw-args rest))))

(greet "John")
((trace-wrap greet) "Jonh" #:hi "Howdy")

(define greet2
  (case-lambda [(name) (string-append "Your name is " name)]
               [(name given) (string-append "You have a given name " given)]))

(greet2 "yonglu" "sun")

(define salutation (list-ref '("dog" "cat") (random 2)))

salutation

; (define id body ...+) (define (id arg ...) body ...+) (define id (lambda (arg ...) body ...+)


(define (duplicate pos lst)
  (let dup ([i 0]
            [lst lst])
    (cond
      [(= i pos) (cons (car lst) lst)]
      [else (cons (car lst) (dup (+ i 1) (cdr lst)))])))

(duplicate 1 (list "red" "blue" "green"))

; multiple values: let-values, let*-values, letrec-values

(let-values ([(red blue green) (values "red" "blue" "green")])
  (string-append red " " blue " " green))

; conditionals

(member "red" '("red" "blue" "green"))

; branch if: (if test-expr then-expr else-expr)


; guidelines for using assignment

; assigning to a shared identifier is no substitute for passing an argument to a procedure or getting its result
; really awful examples
(define name "unknown")
(define result "unknown")
(define (greet3)
  (set! result (string-append "hello, " name)))

(set! name "Jonh")
(greet3)
(display result)
(newline)

; a sequence of assignments to a local variable is far inferior to nested bindings
;bad example

(let ([tree 0])
  (set! tree (list tree 1 tree))
  (set! tree (list tree 2 tree))
  (set! tree (list tree 3 tree))
  tree)

; ok
(let* ([tree 0]
      [tree (list tree 1 tree)]
      [tree (list tree 2 tree)]
      [tree (list tree 3 tree)])
  tree)

; Using assignment to accumulate results from an iteration is bad style.

; bad example
(define (sum-for lst)
  (let ([s 0])
    (for-each (lambda (i) (set! s (+ i s))) lst)
    s))

(sum-for '(1 2 3))

; ok
(define (sum-loop lst)
  (let loop ([lst lst]
             [s 0])
    (if (null? lst)
        s
        (loop (cdr lst) (+ s (car lst))))))

(sum-loop '(1 2 3))

; better

(define (sum-apply lst)
  (apply + lst))

(sum-apply '(1 2 3))

; good

(define (sum-fold lst)
  (for/fold ([s 0])
            ([i (in-list lst)])
    (+ s i)))

(sum-fold '(1 2 3))

;stateful object

(define next-number!
  (let ([s 0]
        [m (printf "initialize\n")])
    (lambda () (set! s (add1 s))
      s)))

(next-number!)
(next-number!)
(next-number!)

; Multiple Values: set!-values; (set!-values (id ...) expr ...)

(define (swap-values first last)
  (set!-values (last first) (values first last))
  (values first last))

(swap-values 1 2)


; Quoting: quote and ', (quote datum)

; The datum can be a symbol, a boolean, a number, a (character or byte) string, a character,
; a keyword, an empty list, a pair (or list) containing more such values, a vector containing
; more such values, a hash table containing more such values, or a box containing another
; such value.

(quote apple)
(quote #t)
(quote "apple")
(quote 10)

; A datum cannot be a printed representation that starts with #<, so it cannot
; be #<void>, #<undefined>, or a procedure

; The quote form is more typically used for symbols and lists, which have other meanings (identifiers, function
; calls, etc.) when not quoted.