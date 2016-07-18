#lang racket

(regexp-match #rx"(pu )*" "pu pu haha")

; back reference

(regexp-replace #rx"_(.+?)_" "the _nina_, _racket_, _java_" "*\\1*")

; non-capturing clusters

(regexp-match #rx"(^?:[a-z]*/)*[a-z]+$" "/usr/local/bin/racket")

; cloisters

(regexp-match #rx"(?i:book)" "this Book is so interesting")