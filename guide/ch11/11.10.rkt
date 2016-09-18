#lang racket

; Iteration Performance

; fast-clause	 	=	 	[id fast-seq]
; 	 	|	 	[(id) fast-seq]
;	 	|	 	[(id id) fast-indexed-seq]
; 	 	|	 	[(id ...) fast-parallel-seq]
;  fast-seq	 	=	 	(in-range expr)
; 	 	|	 	(in-range expr expr)
; 	 	|	 	(in-range expr expr expr)
; 	 	|	 	(in-naturals)
; 	 	|	 	(in-naturals expr)
; 	 	|	 	(in-list expr)
; 	 	|	 	(in-vector expr)
; 	 	|	 	(in-string expr)
; 	 	|	 	(in-bytes expr)
; 	 	|	 	(in-value expr)
; 	 	|	 	(stop-before fast-seq predicate-expr)
; 	 	|	 	(stop-after fast-seq predicate-expr)
;  fast-indexed-seq	 	=	 	(in-indexed fast-seq)
; 	 	|	 	(stop-before fast-indexed-seq predicate-expr)
; 	 	|	 	(stop-after fast-indexed-seq predicate-expr)
;  fast-parallel-seq	 	=	 	(in-parallel fast-seq ...)
; 	 	|	 	(stop-before fast-parallel-seq predicate-expr)
; 	 	|	 	(stop-after fast-parallel-seq predicate-expr)

(time (for ([ i (in-range 100000)])
        (for ([elem (in-list '(a b c d e f g h))])    ; fast
          (void))))

(time (for ([ i (in-range 100000)])
        (for ([elem '(a b c d e f g h)])    ; slow
          (void))))