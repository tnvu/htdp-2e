;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 04|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 4. Use the same setup as in exercise 3 to create an expression that
; deletes the ith position from str. Clearly this expression creates a shorter
; string than the given one. Which values for i are legitimate?

(define str "helloworld")
(define i 5)
(string-append (substring str 0 i) (substring str (+ i 1)))

; Legitimate values for i: 0 <= i < (string-length str)