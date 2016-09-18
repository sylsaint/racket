#lang racket

(require "13.0.rkt")

(define ling (new fish% [size 100]))
(send ling get-size)
(send ling grow 50)
(send ling get-size)

; in racket, during the class instantiation, if we want to use superclass's method
; we need to use (super-new), then call its methods

(define hungry-fish% (class fish%
                       (super-new)
                       (define/public (eat-more fish1 fish2)
                         (send this eat fish1)
                         (send this eat fish2))))

; alternately, we can use inherit to declare the existence of a method

(define huge-fish% (class fish%
                     (super-new)
                     (inherit eat)
                     (define/public (swallow fish1 fish2)
                       (eat fish1)
                       (eat fish2))))
; To achieve performance similar to inherit-based method calls when invoking a method from outside the method’s class,
; the programmer must use the generic form, which produces a class- and method-specific generic method to be invoked with send-generic

(define get-fish-size (generic fish% get-size))
(displayln "get generic size")
(send-generic ling get-fish-size)

(define picky-fish% (class fish% (super-new)
                      (define/override (grow amt)
                        (super grow (* 3/4 amt)))))
(define daisy (new picky-fish% [size 20]))

(send daisy get-size)