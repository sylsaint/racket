#lang racket

; (define-member-name id member-key-expr)

; A method declared with pubment is like public, but the method cannot be overridden in subclasses;
; it can be augmented only. A pubment method must explicitly invoke an augmentation (if any) using inner;
; a subclass augments the method using augment, instead of override.
