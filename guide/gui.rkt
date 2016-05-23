#lang slideshow

(require racket/class
         racket/gui/base)

(require "graph.rkt")
(require "module.rkt")

(define f (new frame% [label "My art"]
               [width 200]
               [height 200]
               [alignment '(center center)]))


(define (add-drawing p)
  (let ([drawer (make-pict-drawer p)])
    (new canvas% [parent f]
         [style '(border)]
         [paint-callback (lambda (self dc)
                            (drawer dc 0 0))])))

(add-drawing (pict+code (circle 10)))

(add-drawing (colorize (filled-flash 50 30) "yellow"))
         