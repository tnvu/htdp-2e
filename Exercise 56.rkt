;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 56|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 56. Define main2 so that you can launch the rocket and watch it lift
; off. Read up on the on-tick clause to determine the length of one tick and how
; to change it.
; If you watch the entire launch, you will notice that once the rocket reaches
; the top something curious happens. Explain. Add a stop-when clause to main2 so
; that the simulation of the liftoff stops gracefully when the rocket is out of
; sight.

(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 30)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
 
(define CENTER (/ (image-height ROCKET) 2))

(define (place-rocket x)
  (place-image ROCKET 10 (- x CENTER) BACKG))

(define (show x)
  (cond [(string? x) (place-rocket HEIGHT)]
        [(<= -3 x -1) (place-image (text (number->string x) 20 "red")
                                   10 (* 3/4 WIDTH)
                                   (place-rocket HEIGHT))]
        [(>= x 0) (place-rocket x)]))

(define (launch x ke)
  (cond [(string? x) (if (string=? " " ke) -3 x)]
        [(<= -3 x -1) x]
        [(>= x 0) x]))

(define (fly x)
  (cond [(string? x) x]
        [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
        [(>= x 0) (- x YDELTA)]))

(define (end? x)
  (cond [(string? x) #false]
        [(<= -3 x -1) #false]
        [(>= x 0) (> (- x CENTER) HEIGHT)]))

(define (main2 s)
  (big-bang s
    [to-draw show]
    [on-key launch]
    [on-tick fly 1]
    [stop-when end?]))

(main2 "resting")