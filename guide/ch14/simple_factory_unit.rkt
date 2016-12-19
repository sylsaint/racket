#lang racket

(require "toy_factory_sig.rkt")

(define-unit simple-factory@
             (import)
             (export toy-factory^)

             (printf "Factory started.\n")

             (define-struct toy (color) #:transparent)

             (define (build-toys n)
               (for/list ([i (in-range n)])
                 (make-toy 'blue)))

             (define (repaint t col)
               (make-toy col)))

(provide simple-factory@)
