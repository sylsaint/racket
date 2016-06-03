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

; 6.2.3 Submodules

; A module form can be nested within a module, in which case the nested module form declares a submodule.
; Submodules can be nested within submodules, and a submodule can be referenced directly by a module
; other than its enclosing module by using a submodule path

; (module* name-id initial-module-path-or-#f decl ...)

; 1. A submodule declared with module can be required by its enclosing module, but the submodule cannot require the enclosing
;    module or lexically reference the enclosing module’s bindings.

; 2. A submodule declared with module* can require its enclosing module, but the enclosing module cannot require the submodule.

; In addition, a module* form can specify #f in place of an initial-module-path, in which case the submodule sees all of the enclosing
; module’s bindings—including bindings that are not exported via provide.

; Declaring a module does not immediately evaluate the body definitions and expressions of
; the module. The module must be explicitly required at the top level to trigger evaluation.
; After evaluation is triggered once, later requires do not re-evaluate the module body.
