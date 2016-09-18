#lang racket

(require "13.0.rkt")

(define size-10-fish% (class fish% (super-new [size 10])))

; A subclass can supply additional initialization arguments for its superclass in a super-new call,
; and such initialization arguments take precedence over arguments supplied to new

(define fish10 (new size-10-fish%))
(send fish10 get-size)


(define default-10-fish% (class fish%
                           (init [size 15])
                           (super-new [size size])))

(define fish15 (new default-10-fish% [size 25]))
(send fish15 get-size)

; 13.3 internal and external names

; when identifiers are used in initialization as arguments, they are external; when used in class, they are internal
; when methods are used in expression such like `send`, they are external; when used in class, they are internal

