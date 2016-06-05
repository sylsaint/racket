#lang racket

; The use of set! on variables defined within a module is limited to the body of the defining module.
; That is, a module is allowed to change the value of its own definitions, and such changes are visible to importing modules.
; However, an importing context is not allowed to change the value of an imported binding.

(module m racket
  (provide counter increment!)
  (define counter 0)
  (define (increment!)
    (set! counter (add1 counter))))

(require (prefix-in calc: 'm))
calc:counter
(calc:increment!)
calc:counter

; cannot mutate module-required identifier
; (set! calc:counter -1)