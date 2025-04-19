;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 58|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 58. Introduce constant definitions that separate the intervals for
; low prices and luxury prices from the others so that the legislators in Tax
; Land can easily raise the taxes even more.

(define TAX_NONE 0.00)
(define TAX_LOW 0.05)
(define TAX_LUXURY 0.08)

; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item

; Price -> Number
; computes the amount of tax charged for p
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) TAX_NONE]
    [(and (<= 1000 p) (< p 10000)) (* TAX_LOW p)]
    [(>= p 10000) (* TAX_LUXURY p)]))
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* TAX_LOW 1000))
(check-expect (sales-tax 12017) (* TAX_LUXURY 12017))
