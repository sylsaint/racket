#lang racket
"apple"
(display #\u03BB)
(display #\newline)

(display "a \" quoted \" string")
(display #\newline)
(display"backslash \\")

; inmutable and mutable strings
(define s (make-string 5 #\.))
(display #\newline)
(string-ref s 0)
(string-set! s 2 #\u03BB)
(display s)
(display #\newline)