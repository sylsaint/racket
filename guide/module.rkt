#lang slideshow

(require "graph.rkt")

(rainbow (square 10))

(require slideshow/code)

(code (circle 10))

(define-syntax pict+code
  (syntax-rules ()
               [(pict+code expr)
                (hc-append 10
                           expr
                           (code expr))]))

(pict+code (square 10))

(provide pict+code)