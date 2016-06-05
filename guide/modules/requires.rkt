#lang racket

; A require form can appear within a module
; A require form can also appear at the top level, in which case it both imports bindings and instantiates the specified module
; A single require can specify multiple imports at once. (require require-spec ...)
; A single require can import a given identifier at most once, whereas a separate require can replace the bindings of a previous require

; (only-in require-spec id-maybe-renamed ...)
; id-maybe-renamed	= id
; 	 	          | [orig-id bind-id]
; Also, only-in optionally renames each binding that is preserved: in a [orig-id bind-id] form

(module m (lib "racket")
  (provide tastes-great?
           less-filling?)
  (define tastes-great? #t)
  (define less-filling? #t))

(require (only-in 'm tastes-great?))
(display tastes-great?)
(newline)

(require (only-in 'm tastes-great? [less-filling? lf]))
(display tastes-great?)
(newline)
(display lf)
(newline)

; (except-in require-spec id ...)
; This form is the complement of only-in: it excludes specific bindings from the set specified by require-spec.

; (rename-in require-spec [orig-id bind-id] ...)

; (prefix-in prefix-id require-spec)
; This is a shorthand for renaming, where prefix-id is added to the front of each identifier specified by require-spec.
(require (prefix-in m: 'm))
(display m:tastes-great?)
(newline)