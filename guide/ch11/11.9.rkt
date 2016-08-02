#lang racket

; (for (clause ...)
;  body-or-break ... body)
; 
;clause	 	=	 	[id sequence-expr]
; 	 	|	 	#:when boolean-expr
; 	 	|	 	#:unless boolean-expr
; 	 	|	 	break
; 	 	 	 	 
;body-or-break	 	=	 	body
; 	 	|	 	break
; 	 	 	 	 
;break	 	=	 	#:break boolean-expr
; 	 	|	 	#:final boolean-expr

(for ([cfg '("context" "free" "grammar")]
      #:break (equal? cfg "free")
      [i (in-range (string-length cfg))])
  (printf "~a iterates: ~a times\n" cfg i))