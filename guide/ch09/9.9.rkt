#lang racket

; Positive lookahead with ?= peeks ahead to ensure that its subpattern could match

(regexp-match-positions #rx"play(?=ground)" "the children wanders on the playground")

; look behind

; Positive lookbehind with ?<= checks that its subpattern could match immediately to the left of the current position in the text string.

(regexp-match-positions #rx"(?<=play)ground" "the children wanders on the playground")

; negative lookbehind

; Negative lookbehind with ?<! checks that its subpattern could not possibly match immediately to the left

(regexp-match-positions #rx"(?<!play)ground" "playground consists of play and ground")