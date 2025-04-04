;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 09|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 9. Add the following line to the definitions area of DrRacket:
;
;   (define in ...)
;
; Then create an expression that converts the value of in to a non-negative
; number. For a String, it determines how long the String is; for an Image, it
; uses the area; for a Number, it uses the absolute value; for #true it uses 10
; and for #false 20. Hint Check out cond from the Prologue: How to Program
; (again).
; See exercise 1 for how to create expressions in DrRacket.

(define in ...)
(cond [(string? in) (string-length in)]
      [(image? in)  (* (image-width in) (image-height in))]
      [(number? in) (abs in)]
      [(boolean? in) (if in 10 20)])
