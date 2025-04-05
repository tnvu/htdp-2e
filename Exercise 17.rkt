;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 17|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 17. Define the function image-classify, which consumes an image and
; conditionally produces "tall" if the image is taller than wide, "wide" if it
; is wider than tall, or "square" if its width and height are the same. See
; exercise 8 for ideas.

(define (image-classify image)
  (cond [(> (image-height image) (image-width image)) "tall"]
        [(< (image-height image) (image-width image)) "wide"]
        [(= (image-height image) (iamge-width image)) "square"]))
