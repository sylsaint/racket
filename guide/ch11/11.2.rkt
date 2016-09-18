#lang racket
; (for (clause ...)
;  body ...+)
; 
; clause	 	=	 	[id sequence-expr]
;  	 	|	 	#:when boolean-expr
;  	 	|	 	#:unless boolean-expr

(for ([i '(1 2 3)]
      [chapter '("chapter 1" "chapter 2" "chapter 3")])
  (printf "~a: ~a\n" chapter i))

; The for* form, which has the same syntax as for, nests multiple sequences instead of running them in parallel

(for* ([i '(1 2 3)]
      [chapter '("chapter 1" "chapter 2" "chapter 3")])
  (printf "~a: ~a\n" chapter i))

; The #:when boolean-expr is another shorthand for conditional judgement

(for* ([chapter '("racket" "java" "python")]
       [i '(1 2 3)]
       #:when (not (equal? chapter "racket")))
  (printf "Language ~a: ~a\n" chapter i))

; 