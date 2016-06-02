#lang racket

; (struct struct-id (field-id ...))

(struct person (first last))

(define p1 (person "yonglu" "sun"))

(person-first p1)

; struct-id : a constructor function that takes as many arguments as the number of field-ids, and returns an instance of the structure type
;struct-id? : a predicate function that takes a single argument and returns #t if it is an instance of the structure type, #f otherwise.
; struct-id-field-id : for each field-id, an accessor that extracts the value of the corresponding field from an instance of the structure type

(equal? (person? p1) #t)

; A struct form places no constraints on the kinds of values that can appear for fields in an instance of the structure type

; struct:struct-id : a structure type descriptor, which is a value that represents the structure type as a first-class value

(display struct:person)
(newline)

; The struct-copy form clones a structure and optionally updates specified fields in the clone
; (struct-copy struct-id struct-expr [field-id expr] ...)

(define p2 (struct-copy person p1 [first "ailing"] [last "bi"]))
(person-first p2)

; Structure Subtypes

; (struct struct-id super-id (field-id ...))

(struct woman person (age gender))
(define w1 (woman "ailing" "bi" 26 "female"))
(woman-gender w1)
(person-first w1)

; opaque and transparent structs, default is opaque, add #:transparent
; (struct struct-id [field-id expr] ... #:transparent)

(struct man person (age gender) #:transparent)

(define m1 (man "yonglu" "sun" 28 "male"))

;A transparent structure type also allows reflective operations, such as struct? and struct-info, to be used on its instances
(struct? m1)
(struct-info m1)

; struct comparison
; A generic equal? comparison automatically recurs on the fields of a transparent structure type, but equal?
; defaults to mere instance identity for opaque structure types
(equal? m1 m1)

; Structure Type Generativity

; Each time that a struct form is evaluated,it generates a structure type that is
; distinct from all existing structure types, even if some other structure type has the same name and fields.

(define (add-bigger-fish lst)
  (struct fish (size) #:transparent)
  (cond [(null? lst) (list (fish 1))]
        [else (cons (fish (* 2 (fish-size (car lst))))
                    lst)]))

(add-bigger-fish null)

; A prefab (“previously fabricated”) structure type is a built-in type that is known to the Racket printer
; and expression reader. Infinitely many such types exist, and they are indexed by name, field count, supertype,
; and other such details. The printed form of a prefab structure is similar to a vector, but it starts #s instead of
; just #, and the first element in the printed form is the prefab structure type’s name.

(define lunch '#s(sprout bean))
(struct sprout (kind) #:prefab)
(sprout? lunch)
(sprout-kind lunch)

; The field name kind above does not matter for finding the prefab structure type;
(sprout? #s(sprout bean #f 17))

(struct sprout (kind yummy? count) #:prefab)
(sprout? #s(sprout bean #f 17))