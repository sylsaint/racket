#lang racket

; for most simple io functions, the target port is an optional number.
; the default is the current-output-port, current-input-port or current-error-port

(displayln "HI")

(displayln "HI" (current-output-port))

(define (swing-hammer) (displayln "Ouch!" (current-error-port)))
(swing-hammer)

; The current-port functions are actually parameters, which means that their values can be set with parameterize

(define s (open-output-string))
(parameterize ([current-error-port s])
  (swing-hammer)
  (swing-hammer)
  (swing-hammer)
  (get-output-string s))