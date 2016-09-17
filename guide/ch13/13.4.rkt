#lang racket

; 13.4 interfaces

; An interface in Racket is created using the interface form, which merely declares the method names required to implement the interface
; An interface can extend other interfaces, which means that implementations of the interface automatically implement the extended interfaces

; (interface (superinterface-expr ...) id ...)

; to declare a class implement an interface, use class* form

; (class* superclass-expr (superinterface-expr ...) decl_or_expr ...)

(define fish-interface (interface () grow get-size eat))
(define fish% (class* object% (fish-interface)
                (super-new)
                (init size)
                (define current-size size)
                (define/pubment (grow amt)
                  (set! current-size (+ current-size amt)))
                (define/public (get-size)
                  current-size)
                (define/public (eat fish)
                  (set! current-size (+ current-size (send fish get-size))))))

(define charlie (new fish% [size 10]))
(define lucy (new fish% [size 15]))

(displayln (send charlie get-size))
(send charlie eat lucy)
(displayln (send charlie get-size))

; The is-a? predicate accepts an object as its first argument and either a class or interface as its second argument

(is-a? charlie fish%)

; the implementation? predicate checks whether a given class implements a given interface