;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 51|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 51. Design a big-bang program that simulates a traffic light for a
; given duration. The program renders the state of a traffic light as a solid
; circle of the appropriate color, and it changes state on every clock tick.
; Hint Read the documentation for big-bang; there is a reason all these “words”
; are linked to their documentation. What is the most appropriate initial state?
; Ask your engineering friends.

(define WIDTH 50)
(define LENGTH (* 3 WIDTH))
(define BACKGROUND (empty-scene WIDTH LENGTH))

(define (tock cw)
  (cond [(string=? cw "red") "green"]
        [(string=? cw "yellow") "red"]
        [(string=? cw "green") "yellow"]))

(define (render cw)
  (place-image
   (above (circle (/ WIDTH 2) "solid"
                  (if (string=? cw "red") "red" "black"))
          (circle (/ WIDTH 2) "solid"
                  (if (string=? cw "yellow") "yellow" "black"))
          (circle (/ WIDTH 2) "solid"
                  (if (string=? cw "green") "green" "black")))
   (/ WIDTH 2) (/ LENGTH 2)
   BACKGROUND))

(define (main ws)
  (big-bang ws
    [on-tick tock 1]
    [to-draw render]))
(main "red")