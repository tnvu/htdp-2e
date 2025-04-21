;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 72|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 72. Formulate a data definition for the above phone structure type
; definition that accommodates the given examples.
;
; Next formulate a data definition for phone numbers using this structure type
; definition:
;   (define-struct phone# [area switch num])
;
; Historically, the first three digits make up the area code, the next three the
; code for the phone switch (exchange) of your neighborhood, and the last four
; the phone with respect to the neighborhood. Describe the content of the three
; fields as precisely as possible with intervals.

(define-struct phone [area number])
; A phone is a structure:
;  (make-phone Number String)
; interpretation: an area code and phone number

(define-struct phone# [area switch num])
; A phone# is a structure:
;  (make-phone# Number Number Number)
; interpretation: area code, phone switch exchange, line number
; N = [2-9], X = [0-9]
; area code = [200-999], excluding NXX, N9X, 37X, and 96X
; switch = [200-999], excluding N11
; num = [0000-9999]
