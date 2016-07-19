#lang racket

; When an exception is raised, control escapes out of an arbitrary deep evaluation context to the point
; where the exception is caught—or all the way out if the exception is never caught

; (+ 1 (+ 1 (+ 1 (+ 1 (/ 1 0)))))

; The call-with-continuation-prompt function installs a prompt with a given prompt tag, and then it evaluates a given thunk under the prompt
; The default-continuation-prompt-tag function returns the default prompt tag.
; The abort-current-continuation function escapes to the nearest enclosing prompt that has a given prompt tag.

(define (escape v)
    (abort-current-continuation
     (default-continuation-prompt-tag)
     (lambda () v)))

(+ 1 (+ 1 (+ 1 (+ 1 (+ 1 (+ 1 (escape 0)))))))

(+ 1 (call-with-continuation-prompt
      (default-continuation-prompt-tag)
      (lambda () (+ 1 (+ 1 (+ 1 (+ 1 (+ 1 (+ 1 (escape 0))))))))))