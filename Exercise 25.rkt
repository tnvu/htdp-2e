;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 25|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 25. Take a look at this attempt to solve exercise 17:
;   (define (image-classify img)
;     (cond
;       [(>= (image-height img) (image-width img)) "tall"]
;       [(= (image-height img) (image-width img)) "square"]
;       [(<= (image-height img) (image-width img)) "wide"]))
; Does stepping through an application suggest a fix?

(define (image-classify img)
  (cond [(>= (image-height img) (image-width img)) "tall"]
        [(= (image-height img) (image-width img)) "square"]
        [(<= (image-height img) (image-width img)) "wide"]))

(image-classify (empty-scene 10 100))
(image-classify (empty-scene 100 100))
(image-classify (empty-scene 100 10))

; Stepping through the application with the appropriate test cases does suggest
; a fix. The >= should be > and <= should be <.