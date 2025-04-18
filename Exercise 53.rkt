;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 53|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 53. The design recipe for world programs demands that you translate
; information into data and vice versa to ensure a complete understanding of the
; data definition. It’s best to draw some world scenarios and to represent them
; with data and, conversely, to pick some data examples and to draw pictures
; that match them. Do so for the LR definition, including at least HEIGHT and 0
; as examples.

; An LR (short for launching rocket) is one of:
; - "resting"
; - NonnegativeNumber
; interpretation "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight
; an LR of value HEIGHT means the bottom of the rocket is HEIGHT pixels from the
; top of the canvas
; an LR of value 0 means the bottom of the rocket is at ground level

(define ROCKET (above (triangle 10 "solid" "black")
                      (rectangle 10 30 "solid" "black")))
(define BACKGROUND (empty-scene 100 100))

(define (render y)
  (place-image ROCKET
               (/ (image-width BACKGROUND) 2) (- (image-height BACKGROUND) (/ (image-height ROCKET) 2) y)
               BACKGROUND))

(render 0)
(render 10)
(render 20)
(render 30)
(render 40)
(render 50)