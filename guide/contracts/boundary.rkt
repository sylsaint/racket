#lang racket

; 1. boundary

; The agreement specifies obligations and guarantees for each “product” (or value) that is handed from one party to the other

; In this spirit, Racket encourages contracts mainly at module boundaries. Specifically, programmers may attach contracts
; to provide clauses and thus impose constraints and promises on the use of exported values.

(provide (contract-out [amount positive?]))
(define amount 10)

; The contracts library is built into the Racket language, but if you wish to use racket/base,
; you can explicitly require the contracts library like this

; 2. violation

; To make the contract capture our intentions for all Racket values, we can ensure that the value is both a number and is positive,
; combining the two contracts with and/c

(provide (contract-out [number (and/c number? positive?)]))
(define number 10)

; 3. Experimenting with Contracts and Modules
; All of the contracts and modules in this chapter (excluding those just following) are written using the standard #lang syntax for describing modules.
; 