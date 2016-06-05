#lang racket
(module zoo racket
  (module animal-house racket
    (provide monkey)
    (define monkey "Curious George")))

(require (submod 'zoo animal-house))
(display monkey)
(newline)