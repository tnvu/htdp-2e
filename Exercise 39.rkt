;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 39|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 39. Good programmers ensure that an image such as CAR can be enlarged
; or reduced via a single change to a constant definition. Good programmers
; establish a single point of control for all aspects of their programs, not
; just the graphical constants. Several chapters deal with this issue. We
; started the development of our car image with a single plain definition:
;   (define WHEEL-RADIUS 5)
; The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence,
; changing WHEEL-RADIUS from 5 to 10 doubles the size of the car image. This
; kind of program organization is dubbed single point of control, and good
; design employs this idea as much as possible.
; Develop your favorite image of an automobile so that WHEEL-RADIUS remains the
; single point of control.

(define WHEEL-RADIUS 5)
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-RADIUS (/ WHEEL-RADIUS 2) "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define BODY (above (rectangle (* 4 WHEEL-RADIUS) WHEEL-RADIUS "solid" "red")
                    (rectangle (* 7 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red")))
(define CAR (underlay/align/offset "middle" "bottom" BODY 0 WHEEL-RADIUS BOTH-WHEELS))
(place-image CAR 50 50 (empty-scene 100 100))
