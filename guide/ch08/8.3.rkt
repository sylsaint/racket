#lang racket

; Reading and Writing Racket data

; Overall, print corresponds to the expression layer of Racket syntax,
; write corresponds to the reader layer, and display roughly corresponds to the character layer.

(define lst '("i" pod))
(print lst)
(newline)
(write lst)
(newline)
(displayln lst)

; In the format string supplied to printf, ~a displays the next argument, ~s writes the next argument, and ~v prints the next argument

(define (deliver who when what)
  (printf "Items ~a for shopper ~s: ~v" who when what))

(deliver '("list") '("John") '("milk"))