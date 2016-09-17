#lang racket

; (class superclass-expr decl-or-expr ...)

; instead of a method-like constructor, a class has initialization expressions interleaved with field and method declarations

; By convention, class names end with %. The built-in root class is object%

; class with public method `get-size`, `grow` and `eat`

(define fish% (class object%
  (init size)                  ; initialization argument
  (define current-size size)   ; field
  (super-new)                  ; super class initialization
  (define/public (get-size)
    current-size)
  (define/public (grow amt)
    (set! current-size (+ amt current-size)))
  (define/public (eat other-fish)
    (grow (send other-fish get-size)))))

(define charlie (new fish% [size 10]))

; super-new must be used, anyway, because a class must always invoke its superclass’s initialization.
; Initialization arguments, field declarations, and expressions such as (super-new) can appear in any order within a class

(provide fish%)