#lang racket

; A continuation is a value that encapsulates a piece of an expression’s evaluation context.

; The call-with-composable-continuation function captures the current continuation starting
; outside the current function call and running up to the nearest enclosing prompt.

(define save-k #f)

(define (save-it!)
  (call-with-composable-continuation (lambda (v) (set! save-k v) 0)))

(+ 1 (+ 1 (+ 1 (save-it!))))

(save-k 0)
(displayln save-k)

; The continuation captured by call-with-composable-continuation is determined dynamically, not syntactically.

(define (sum n)
  (if (zero? n)
      (save-it!)
      (+ n (sum (sub1 n)))))

(sum 5)

; the continuation in saved-k becomes (lambda (x) (+ 5 (+ 4 (+ 3 (+ 2 (+ 1 x))))))

(save-k 10)

; A more traditional continuation operator in Racket (or Scheme) is call-with-current-continuation, which is usually abbreviated call/cc.

; It is like call-with-composable-continuation, but applying the captured continuation first aborts (to the current prompt)
; before restoring the saved continuation

; Continuations as in Racket are sometimes called delimited continuations, since a program can introduce new delimiting prompts,
; and continuations as captured by call-with-composable-continuation are sometimes called composable continuations,
; because they do not have a built-in abort.