#lang racket

(car (cons 1 2))
(pair? (cons 1 2))
(pair? '(1 2 3))

(cons 1 (cons 2 3))
(list (list 1) (list 2 3) (list 4 5 6))

(list? (quote (1 2 3)))

; quote

(quote ((1 2 3) ("red" "blue" "green")))
(quote (2 . 3))

; wrap an identifier with quote
(quote jade-done)

(symbol? map)
(symbol? (quote map))
(string->symbol "map")
(symbol->string (quote map))

(list? (first (list (list 1) (list 2 3) (list 4 5))))
(list? (first (quote ((1) (2 3) (4 5)))))
(car ''road)

; test
(define road "501")
(define iphone "6s")
(car (quote (road iphone)))