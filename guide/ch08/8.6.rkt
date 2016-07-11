#lang racket

; If you want to process individual lines of a file, then you can use for with in-lines:

(define (upcase-all in)
  (for ([l (in-lines in)])
    (displayln (string-upcase l))))

(upcase-all (open-input-string (string-append "Hello world!\nCan you hear me, now?")))

; apply a regular expression  to a stream

(define (has-hello? in)
  (regexp-match? #rx"hello" in))

(has-hello? (open-input-string "hello world"))

; If you want to copy one port into another, use copy-port from racket/port, which efficiently
; transfers large blocks when lots of data is available, but also transfers small blocks immediately
; if that’s all that is available

(define s-in (open-input-string "hehe"))
(define s-out (open-output-string))
(copy-port s-in s-out)
(get-output-string s-out)