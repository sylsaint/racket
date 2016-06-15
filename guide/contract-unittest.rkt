#lang racket

(require "contract-test.rkt")

(display amount)
(newline)
(deposit 10)
(balance)
; (f 10)

(report-cost 10 100)
(report-cost "hundreds")