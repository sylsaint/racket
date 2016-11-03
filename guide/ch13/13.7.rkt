#lang racket

; mixins

(require "13.0.rkt")
(require "13.1.rkt")

(define grower-interface (interface () grow))

(define (picky-mixin %)
  (u (implementation? % grower-interface))
  (class % (super-new)
    (define/override (grow amt) (super grow (* 3/4 amt)))))
(define picky-fish% (picky-mixin fish%))

(define (hungry-mixin %)
  (class % (super-new)
    (inherit eat)
    (define/public (eat-more fish1 fish2)
      (eat fish1)
      (eat fish2))))

(define hungry-picky-fish%
  (hungry-mixin (picky-mixin fish%)))

; mixin and interfaces

; Using implementation?, picky-mixin could require that its base class implements interface

