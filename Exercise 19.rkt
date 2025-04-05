;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 19|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 19. Define the function string-insert, which consumes a string str
; plus a number i and inserts "_" at the ith position of str. Assume i is a
; number between 0 and the length of the given string (inclusive). See exercise
; 3 for ideas. Ponder how string-insert copes with "".

(define (string-insert str i)
  (if (= 0 (string-length str))
      "_"
      (string-append (substring str 0 i) "_" (substring str i))))
