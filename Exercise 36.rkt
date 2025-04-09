;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 36|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 36. Design the function image-area, which counts the number of
; pixels in a given image.

; we use images
; Image -> Number
; returns the number of pixels in img
; given: (empty-scene 10 10), expects: 100
; given: (empty-scene 1 1), expects: 1
(define (image-area img)
  (* (image-width img) (image-height img)))

(image-area (empty-scene 10 10))
(image-area (empty-scene 1 1))