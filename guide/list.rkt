#lang racket

(list 1 "abc")
(length (list 12 34))
(list-ref (list 1 4 6) 2)
(append (list 1 4 5) (list 5 6 7))
(member 5 (list 4 6 0))
(reverse (list "red" "blue" "green"))

; predefined list loops

(map sqrt (list 1 4 9 16))

(andmap string? (list "hanghou" "tapei" "shanghai"))

(ormap number? (list 4 5 "red"))

; The map, andmap, and ormap functions can all handle multiple lists

(map (lambda (s n) (substring s 0 n))
     (list "computer networks" "structure and interpretion of computer programs" "machine learning")
     (list 4 19 5))

(filter string? (list "red" "blue" 124))
(filter positive? (list -1 20 68))

(foldl (lambda (elem v)
         (+ v (* elem elem)))
       0
       '(1 2 3))

; list iteration

(first '(5 52 13))
(rest '(5 52 13))

;cons add element to the front of list, empty--get empty list
(cons "head" empty)

(empty? '())
(empty? '("red"))
(cons? '())
(cons? '("superman"))

; self-defined length func for list

(define (s-length lst)
  (cond [(empty? lst) 0]
        [else (+ 1 (s-length(rest lst)))]))

(s-length '(1 2 3 4))

; self-efined map func for list
(define (s-map func lst)
  (cond [(empty? lst) lst]
        [else (cons (func (first lst))
                    (s-map func (rest lst)))]))

(s-map string-upcase '("red" "blue" "green"))

(define (s-length-tail lst)
  (define (iter l n)
    (cond [(empty? l) n]
          [else (iter (rest l) (+ 1 n))]))
  (iter lst 0))

(s-length-tail '(1 2 3 4))

(define (s-map-tail func lst)
  (define (iter f l o)
    (cond [(empty? l) o]
          [else (iter f (rest l) (cons (f (first l)) o))]))
  (iter func lst '()))

(s-map-tail string-upcase '("red" "blue" "green"))