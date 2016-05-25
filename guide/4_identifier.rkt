#lang racket

(let ([define 5]) define)

(define f (lambda (x)
            (let ([y 5])
              (+ x y))))

(f 10)

(define f2 (lambda (append)
             (define cons (append "ugly" "confusing"))
             (let ([append 'yonng-lu])
               (list append cons))))

(f2 list)