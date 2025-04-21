;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 67|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 67. Here is another way to represent bouncing balls:
;   (define SPEED 3)
;   (define-struct balld [location direction])
;   (make-balld 10 "up")
; Interpret this code fragment and create other instances of balld.

(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

(make-balld 0 "down")
(make-balld 100 "up")
