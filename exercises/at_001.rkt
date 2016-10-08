#lang racket

(define Auto001% (class object%
                   (super-new)
                   (define-values (q q0 q00 q001) (values 'q 'q0 'q00 'q001))
                   (define diagram (list '(q0 q) '(q00 q) '(q00 q001) '(q001 q001)))
                   (define alphabet '(0 1))
                   (define start q)
                   (define current start)
                   (define accepts (list q001))

                   (define (transition-diagram index input)
                     (set! current (list-ref (list-ref diagram index) input)))

                   (define (transition-inner input)
                     (cond [(equal? current q) (transition-diagram 0 input)]
                           [(equal? current q0) (transition-diagram 1 input)]
                           [(equal? current q00) (transition-diagram 2 input)]
                           [(equal? current q001) (transition-diagram 3 input)]))

                   (define/public (transition inputs)
                     (map transition-inner inputs))

                   (define/public (get-current)
                     current)
                   (define/public (accept?)
                     (member current accepts))))

(define at001 (new Auto001%))

(send at001 transition '(0 0 1))
(send at001 get-current)
(send at001 accept?)