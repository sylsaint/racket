#lang racket

(require "boundary.rkt")
(display amount)
(newline)
(display number)
(newline)

(require "base-test.rkt")
(display bbox)
(newline)

(require "user-defined-contract.rkt")
(display amount)
(newline)
(deposit 100)
(balance)

(format-number 10)
(format-nat 1)

(require "contract.rkt")
(string-pad-center "haha" 20 #\*)
(max-abs 10 29 -9 32 -98)

(ask-yes-or-no-question "are you a student?" #:default #f #:title "profession")