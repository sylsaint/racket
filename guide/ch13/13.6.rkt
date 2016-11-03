#lang racket

(require "13.0.rkt")

(define hungry-fish% (class fish%
                       (inherit eat)
                       (define/public (eat-more fish1 fish2)
                         (eat fish1)
                         (eat fish2))))

; a programmer can introduce an external-name binding with the define-member-name form
