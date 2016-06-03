#lang racket

(module m (lib "racket")
  ; Use "schematics"'s "random.plt" 1.0, file "random.rkt":
  (require (planet schematics/random:1/random))
  (display (random-gaussian)))

(require 'm)