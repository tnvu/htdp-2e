;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 7. Boolean expressions can express some everyday problems. Suppose
; you want to decide whether today is an appropriate day to go to the mall. You
; go to the mall either if it is not sunny or if today is Friday (because that
; is when stores post new sales items).
;
; Here is how you could go about it using your new knowledge about Booleans.
; First add these two lines to the definitions area of DrRacket:
;   (define sunny #true)
;   (define friday #false)
; Now create an expression that computes whether sunny is false or friday is
; true. So in this particular case, the answer is #false. (Why?)

(define sunny #true)
(define friday #false)
(or (not sunny) friday)

; (or #false #false)
; #false
