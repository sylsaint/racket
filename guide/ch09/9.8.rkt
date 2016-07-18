#lang racket

(regexp-match #rx"a*a" "aaaaa")

; A nonbacktracking regexp is enclosed in (?>...)

(regexp-match #rx"(?>a*)." "aaaa")