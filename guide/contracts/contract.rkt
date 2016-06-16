#lang racket/gui

; 7.3.1 Optional Arguments

(provide (contract-out [string-pad-center
                    (->* (string? natural-number/c)
                         (char?)
                         string?)]))

(define (string-pad-center str width [pad #\space])
  (define field-width (min width (string-length str)))
  (define left-margin (floor (/ (- width field-width) 2)))
  (define right-margin (ceiling (/ (- width field-width) 2)))
  (string-append (build-string left-margin (lambda (x) pad))
                 str
                 (build-string right-margin (lambda (x) pad))))

; The contract combinator ->*, demands several groups of contracts:

; 1. The first one is a parenthesized group of contracts for all required arguments. In this example, we see two: string? and natural-number/c.

; 2. The second one is a parenthesized group of contracts for all optional arguments: char?.

; 3. The last one is a single contract: the result of the function.

; 7.3.2 Rest Arguments

(provide (contract-out
          [max-abs (->* (real?) () #:rest (listof real?) real?)]))
                         

(define (max-abs n . rst)
  (foldr (lambda (n m) (max (abs n) m)) (abs n) rst))

(max-abs 10 15 -2 -29 76)

; 7.3.3 Keyword Arguments


(define (ask-yes-or-no-question question
                                #:default answer
                                #:title title
                                #:width [w 600]
                                #:height [h 300])
  (define d (new dialog% [label title] [width w] [height h]))
  (define msg (new message% [label question] [parent d]))
  (define (yes) (set! answer #t) (send d show #f))
  (define (no) (set! answer #f) (send d show #f))
  (define yes-b (new button%
                     [label "Yes"] [parent d]
                     [callback (λ (x y) (yes))]
                     [style (if answer '(border) '())]))
  (define no-b (new button%
                    [label "No"] [parent d]
                    [callback (λ (x y) (no))]
                    [style (if answer '() '(border))]))
  (send d show #t)
  answer)
 
(provide (contract-out
          [ask-yes-or-no-question
           (-> string?
               #:default boolean?
               #:title string?
               #:width exact-integer?
               #:height exact-integer?
               boolean?)]))

; 7.3.4 Optional Keyword Arguments