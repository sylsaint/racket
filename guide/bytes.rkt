#lang racket

(byte? 0)
(byte? 256)

#"apple"

(bytes-ref #"Apple" 0)
(define b (make-bytes 10 65))
(display b)
(display #\newline)
(bytes-set! b 0 67)
(bytes-set! b 1 96)
(display b)
(display #\newline)
(display "\316\273")
(display #"\316\273")

(bytes->string/utf-8 #"\316\273")
(bytes->string/latin-1 #"\316\273")