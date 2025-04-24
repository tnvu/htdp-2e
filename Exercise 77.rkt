;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 77|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 77. Provide a structure type definition and a data definition for
; representing points in time since midnight. A point in time consists of three
; numbers: hours, minutes, and seconds.

; A time-of-day has:
; -hours: [0-23], hours since midnight
; -minutes: [0-59], minutes of current hour
; -seconds: [0-59], seconds of current minute
(define-struct time-of-day [hours minutes seconds])