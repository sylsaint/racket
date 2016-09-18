#lang racket

(define worker (thread (lambda ()
                         (let loop ()
                           (displayln "working...")
                           (sleep 1)
                           (loop)))))
; (sleep 20)
(kill-thread worker)

; tcp port config
(define tcp-config '(12345 12346 12347))

; cohorts
(define (cohorts port output)
  (thread (lambda ()
                             (displayln (string-append "establish tcp connection..." (number->string port) "-->" (number->string output)))
                             (define server (tcp-listen port))
                             (define-values (c-in c-out) (tcp-connect "localhost" port))
                             (define-values (s-in s-out) (tcp-accept server))
                             (define-values (o-in o-out) (tcp-connect "localhost" output))
                             (let loop ()
                               (displayln "loops...")
                               (display "agree\n" c-out)
                               (sleep 0.5)
                               (loop)))))

; notify

;(define notify (cmd tcp-lst)
;  (for/list ([port tcp-lst])
;    (let-values ([(cin cout) (tcp-connect "localhost" port)])
;      (display cmd cout))))

; coordinator

(define (coordinator cport tcp-lst)
  (displayln (string-append "coordinator starts at " (number->string cport)))
  (define server (tcp-listen cport 3))
  (define listener (thread (lambda ()
                             (for/list ([port tcp-lst])
                               (cohorts port cport)
                               ))))
  (void))

(coordinator 10002 tcp-config)
(sleep 10)