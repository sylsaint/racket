#lang racket

; 7.3.6 Argument and Result Dependencies

(provide (contract-out
          [real-sqrt (->i ([argument (>=/c 1)])
                          [result (arguments) (<=/c argument)])]))

