;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 55|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 55. Take another look at show. It contains three instances of an
; expression with the approximate shape:
;   (place-image ROCKET 10 (- ... CENTER) BACKG)
; This expression appears three times in the function: twice to draw a resting
; rocket and once to draw a flying rocket. Define an auxiliary function that
; performs this work and thus shorten show. Why is this a good idea? You may
; wish to reread Prologue: How to Program.

(define (place-rocket x)
  (place-image ROCKET 10 (- x CENTER) BACKG))

; This is a good idea because it makes it easy to change if we wanted to place
; the rocket in a different place then only one function needs to be changed