#lang racket
(symbol? 'a)

; compare
(eq? 'a 'a)
(eq? 'a 'A)
(eq? 'a #ci'A)

(symbol? 'A#B)
(string->symbol "one, two")
(string->symbol "6")

; write, display
(write 'Apple)
(display 'Apple)
(write '|6|)
(display '|6|)

;gensym, string->uninterned-symbol
(define s (gensym))
s
(eq? s 'g31052)
(eq? 'a (string->uninterned-symbol "a"))