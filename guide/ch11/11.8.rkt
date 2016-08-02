#lang racket

; multi-valued sequences

(for ([(k v) #hash(("apple" . 1) ("banana" . 3))])
  (printf "~a counts: ~a times\n" k v))

; This extension to multiple-value bindings works for all for variants.

(for*/list ([(k v) #hash(("apple" . 1) ("banana" . 3))]
            [(i) (in-range v)])
  k)
