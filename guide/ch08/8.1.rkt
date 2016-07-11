#lang racket

(define out (open-output-file "data.tmp" #:exists 'update))
(display "hello" out)
(close-output-port out)

(define in (open-input-file "data.tmp"))
(read-line in)
(close-input-port in)

(call-with-output-file "data" #:exists 'truncate (lambda (out) (display "hello" out)))

(call-with-input-file "data" (lambda (in) (read-line in)))

; Strings

(define p (open-output-string))
(display "open-output-string" p)
(get-output-string p)

(define r (open-input-string "regular languages\n automata"))
(read-line r)
(read-line r)

; TCP Connections

(define server (tcp-listen 12345))
(define-values (c-in c-out) (tcp-connect "localhost" 12345))
(define-values (s-in s-out) (tcp-accept server))
(display "hello\n" s-out)
(close-output-port s-out)
(read-line c-in)
(read-line c-in)

; Process Pipes

(define-values (process stdout stdin stderr) (subprocess #f #f #f "/usr/bin/wc" "-w"))
(display "hello" stdin)
(read-line stdout)
(close-input-port stdout)
(close-input-port stderr)

; Internal Pipes

(define-values (min mout) (make-pipe))
(display "hehe" mout)
(close-output-port mout)
(read-line min)
(close-input-port min)