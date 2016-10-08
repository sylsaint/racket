#lang racket

(define Modulo3Auto% (class object%
                      (super-new)

                      (define-values (q0 q1 q2) (values 'q0 'q1 'q2))
                      (define diagram (list '(q0 q1 q2) '(q1 q2 q0) '(q2 q0 q1)))
                      (define alphabet '(0 1 2))
                      (define start q0)
                      (define accepts (list start))
                      (define current start)

                      (define/public (transition-inner index input)
                        (set! current (list-ref (list-ref diagram index) input)))

                      (define/public (transition input)
                        (cond [(equal? current q0) (transition-inner 0 input)]
                              [(equal? current q1) (transition-inner 1 input)]
                              [(equal? current q2) (transition-inner 2 input)]))
                      (define/public (get-current) current)
                      (define/public (accept?) (equal? start current))))

(define modulo3 (new Modulo3Auto%))

(send modulo3 transition 0)
(send modulo3 accept?)