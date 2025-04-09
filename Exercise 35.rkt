;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 35|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 35. Design the function string-last, which extracts the last
; character from a non-empty string.

; We use strings.
; String -> 1String
; returns the last character in str
; given: "hello world", expect: "d"
; given: "a", expect: "a"

(define (string-last str)
  (substring str (sub1 (string-length str))))

(string-last "hello world")
(string-last "a")
