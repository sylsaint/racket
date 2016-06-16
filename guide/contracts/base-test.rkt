#lang racket/base

(require racket/contract)

(provide (contract-out [bbox positive?]))

(define bbox 10)