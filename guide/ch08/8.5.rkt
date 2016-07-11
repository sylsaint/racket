#lang racket

; Functions like read-line, read, display, and write all work in terms of characters
; (which correspond to Unicode scalar values). Conceptually, they are implemented in terms of read-char and write-char

; More primitively, ports read and write bytes, instead of characters. The functions read-byte and write-byte read and write raw bytes.

; The read-char and write-char operations always use a UTF-8 encoding