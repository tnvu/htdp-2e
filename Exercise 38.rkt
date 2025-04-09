;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 38|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 38. Design the function string-remove-last, which produces a string
; like the given one with the last character removed.

; we use Strings
; String -> String
; returns a string with the last character removed
; given: "hello world", expects: "hello worl"
; given: "a", expects: ""
(define (string-remove-last str)
  (substring str 0 (sub1 (string-length str))))

(string-remove-last "hello world")
(string-remove-last "a")
