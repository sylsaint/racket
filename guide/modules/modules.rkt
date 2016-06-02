#lang racket

; 6.1.2 Library Collections

(require racket/date)

(printf "Today is ~s\n" (date->string (seconds->date (current-seconds))))

; When require sees a module reference that is unquoted, it converts the reference to a collection-based module path

; 1. First, if the unquoted path contains no /, then require automatically adds a "/main"
; to the reference. For example, (require slideshow) is equivalent to (require
; slideshow/main).

; 2. Second, require implicitly adds a ".rkt" suffix to the path.

; 3. Finally, require resolves the path by searching among installed collections, instead
; of treating the path as relative to the enclosing module’s path.

(require setup/dirs)
(find-collects-dir)

; A package is a set of libraries that are installed through the Racket package manager (or included as pre-installed in a Racket distribution).
; Racket programs do not refer to packages directly. Instead, programs refer to libraries via collections,
; and adding or removing a package changes the set of collection-based libraries that are available.

; A single package can supply libraries in multiple collections, and two
; different packages can supply libraries in the same collection

; 6.1.4 Adding Collections

(get-collects-search-dirs)

; 6.2 Module Syntax

; (module name-id initial-module-path decl ...)