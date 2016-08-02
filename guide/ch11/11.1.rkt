#lang racket
; The for family of syntactic forms support iteration over sequences. Lists, vectors, strings, byte strings, input ports,
; and hash tables can all be used as sequences, and constructors like in-range offer even more kinds of sequences.

; The syntax of for is
; (for ([id sequence-expr] ...)
;  body ...+)

(for ([i '(1 2 3)])
  (display i))

(for ([i "abc"])
  (display i))

(for ([i 4])
  (display i))

; for/list accumulate result into list

(for/list ([i '(1 2 3)])
  (* i i ))

; sequence constructor

(for ([i (in-range 4)])
  (display i))

(for ([i (in-range 1 4 1/2)])
  (displayln i))

; in-naturals, the starting number must be an exact non-negative integer (which defaults to 0), the step is always 1, and there is no upper limit

;(for ([i (in-naturals)])
;  (if (= i 10) (error "too much") (displayln i)))

; The stop-before and stop-after functions construct a new sequence given a sequence and a predicate

(for ([i (stop-before "abc def" char-whitespace?)])
  (display i))

; in-list, in-vector, in-string

(for ([i (in-string "sun")])
  (display i))