#lang racket

; A module path is a reference to a module, as used with require or as the initialmodule path in a module form. It can be any of several forms:

; 1. (quote id) -- a non-file module, often used in REPL
; 2. rel-string
; 3. id -- A module path that is an unquoted identifier refers to an installed library, such as `racket/date`
; 4. (lib rel-string) -- Like an unquoted-identifier path, but expressed as a string instead of an identifier.
;    Example of this form include (lib "racket/date.rkt") and (lib "racket/date"), which are equivalent to racket/date.
; 5. (planet id) -- Accesses a third-party library that is distributed through the PLaneT server. The
;    library is downloaded the first time that it is needed, and then the local copy is used afterward.
; 6. (planet package-string)
; 7. (planet rel-string (user-string pkg-string vers ...))
;    A more general form to access a library from the PLaneT server. In this general
;    form, a PLaneT reference starts like a lib reference with a relative path, but the
;    path is followed by information about the producer, package, and version of the
;    library. The specified package is downloaded and installed on demand.
; 8. (file string) -- Refers to a file, where string is a relative or absolute path using the current platform’s conventions.
;    This form is not portable, and it should not be used when a plain, portable rel-string suffices.
; 9. (submod base element ...+)
;            base =	module-path
; 	 	        |	"."
;                   | 	".."
 	 	 	 	 
;            element = id
; 	 	           |	".."


(provide tiger)
(define tiger "animal")

(require "./lib-string.rkt")