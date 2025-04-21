;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 68|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 68. An alternative to the nested data representation of balls uses
; four fields to keep track of the four properties:
;   (define-struct ballf [x y deltax deltay])
; Programmers call this a flat representation. Create an instance of ballf that
; has the same interpretation as ball1.

(define-struct ballf [x y deltax deltay])
(make-ballf 30 40 -10 5)