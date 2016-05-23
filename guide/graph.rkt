#lang slideshow

(define c (circle 10))
(define r (rectangle 20 10))

(hc-append c r c)

(define (square n)
  (filled-rectangle n n))

(square 10)

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

(four (circle 10))

(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

(checker (colorize (square 10) "red")
         (colorize (square 10) "black"))


(define (checkerboard p)
  (let* ([rp (colorize (square p) "red")]
         [bp (colorize (square p) "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))

(checkerboard 10)

circle

(define (series mk)
  (hc-append 4 (mk 4) (mk 8) (mk 16)))

(series circle)

(series (lambda (size) (checkerboard size)))

(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

(rgb-series circle)

(define (rgb-maker mk)
  (lambda (sz)
   (vc-append
    (colorize (mk sz) "red")
    (colorize (mk sz) "green")
    (colorize (mk sz) "blue"))))

(series (rgb-maker circle))

(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")
       ))

(rainbow (square 10))

(apply vc-append (rainbow (square 10)))

(require pict/flash)
(filled-flash 40 30)

(provide rainbow square filled-flash)