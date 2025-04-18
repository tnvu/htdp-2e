;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 57|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 57. Recall that the word “height” forced us to choose one of two
; possible interpretations. Now that you have solved the exercises in this
; section, solve them again using the first interpretation of the word. Compare
; and contrast the solutions.

; An LR (short for launching rocket) is one of:
; – "resting"
; – NonnegativeNumber
; interpretation "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight
; the word “height” refers to the distance between the ground and the rocket’s
; center

(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define CENTER (/ (image-height ROCKET) 2))

(define (place-rocket x)
  (place-image ROCKET
               10 (- HEIGHT CENTER x)
               BACKG))

(define (render x)
  (cond [(string? x) (place-rocket 0)]
        [(<= -3 x -1) (place-rocket 0)]
        [(>= x 0) (place-rocket x)]))

(define (launch x ke)
  (cond [(string? x) (if (string=? ke " ") -3 x)]
        [(<= -3 x -1) x]
        [(>= x 0) x]))

(define (fly x)
  (cond [(string? x) x]
        [(<= -3 x -1) (+ x 1)]
        [(>= x 0) (+ x YDELTA)]))

(define (main s)
  (big-bang s
    [to-draw render]
    [on-key launch]
    [on-tick fly]))

(main "resting")