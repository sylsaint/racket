#lang racket

(define pie 3)
(define (extract str)
  (substring str 0 pie))

(extract "this is the best racket")

(define (bake flavor)
  (printf "pre-heating oven...\n")
  (string-append flavor " pie"))

(bake "apple")

(define (nobake flavor)
  string-append flavor "jello")

(nobake "apple")

(define (reply s)
  (if (string? s)
      (if (equal? "hello" (substring s 0 5))
          "hi" "huh?")
      "huh?"))

(reply "hello world")
(reply "xxx xxxxx")