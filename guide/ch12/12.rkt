#lang racket

;pattern matching

; (match target-expr
;  [pattern expr ...+] ...)

(match 2
  [1 'first]
  [2 'second]
  [3 'third])

; Constructors like cons, list, and vector can be used to create patterns that match pairs, lists, and vectors

(match '(1 . 2)
  [(list 1 2) 'list]
  [(cons 1 2) 'pair])

; A constructor bound with struct also can be used as a pattern constructor

(struct shoe (size color))
(struct hat (size style))
(match (hat 12 'bowler)
  [(shoe 12 'white) 'shoe]
  [(hat 12 'bowler) 'hat])

; Unquoted, non-constructor identifiers in a pattern are pattern variables that are bound in the result expressions,
; except _, which does not bind (and thus is usually used as a catch-all)

(match '(1)
  [(list x) (+ x 1)]
  [(list x y) (+ x y)])

(match (hat 12 'bowler)
  [(shoe sz 'white) sz]
  [(hat sz 'bowler) sz])

; An ellipsis, written ..., acts like a Kleene star within a list or vector pattern

(match '(1 1 1)
  [(list 1 ...) 'ones]
  [_ 'others])

(match '(1 2 3)
  [(list 1 ...) 'ones]
  [_ 'others])

(match '(1 2 3 4)
  [(list 1 x ... 4) x])

(match (list (hat 22 'bowler) (hat 23 'bowler))
  [(list (hat sz styl) ...) (apply + sz)])

; quasiquote

(match `{with {x 1} {+ x 1}}
    [`{with {,id ,rhs} ,body}
     `{{lambda {,id} ,body} ,rhs}])

; Forms like match-let and match-lambda support patterns in positions that otherwise must be identifiers
(match-let ([(list x y z) '(1 2 3)])
  (list z y x))
