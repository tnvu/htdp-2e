;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 54|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 54. Why would it be incorrect to use (string=? "resting" x) as the
; first condition in show? Conversely, formulate a completely accurate
; condition, that is, a Boolean expression that evaluates to #true precisely
; when x belongs to the first sub-class of LRCD.

; It would be incorrect to use (string=? "resting" x) as the first condition
; in show because we use one condition per sub-class in the data definition.

(and (string? x) (string=? "resting"))
