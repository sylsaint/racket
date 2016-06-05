#lang racket

; (provide provide-spec ...)
; By default, all of a module’s definitions are private to the module.
; The provide form specifies definitions to be made available where the module is required.

; 1. identifier
; 2. (rename-out [orig-id export-id] ...)
; 3. (struct-out struct-id)
;    A struct-out form exports the bindings created by (struct struct-id ....)
; 4. (all-defined-out)
; 5. (all-from-out module-path)
;    The all-from-out shorthand exports all bindings in the module that were imported using a require-spec that is based on module-path.
; 6. (except-out provide-spec id ...)
; 7. (prefix-out prefix-id provide-spec)