#lang racket
; Prefab structure types (see Prefab Structure Types) automatically support serialization

(define-values (in out) (make-pipe))
(write #s(sprout bean) out)
(read in)

; Other structure types created by struct, which offer more abstraction than prefab structure types,
; normally write either using #<....> notation (for opaque structure types) or using #(....) vector notation
; (for transparent structure types). In neither case can the result be read back in as an instance of the structure type

(struct posn (x y))
(define p (posn 1 2))

;(write p out)
;(read in)

; The serializable-struct form defines a structure type that can be serialized to a value that can be printed using write and restored via read

(require racket/serialize)
(serializable-struct sposn (x y) #:transparent)
(deserialize (serialize (sposn 1 2)))
(newline)

(write (serialize (sposn 1 2)) out)
(deserialize (read in))