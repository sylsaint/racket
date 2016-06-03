#lang racket

(module lib-string (lib "racket")
  (require (lib "racket/date"))
  (printf "Today is ~s\n"
          (date->string (seconds->date (current-seconds)))))