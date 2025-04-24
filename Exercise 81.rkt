;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 81|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 81. Design the function time->seconds, which consumes instances of
; time structures (see exercise 77) and produces the number of seconds that have
; passed since midnight. For example, if you are representing 12 hours, 30
; minutes, and 2 seconds with one of these structures and if you then apply
; time->seconds to this instance, the correct result is 45002.

(define-struct time-of-day [hours minutes seconds])

(check-expect (time->seconds (make-time-of-day 12 30 2)) 45002)
(define (time->seconds t)
  (+ (* (time-of-day-hours t) 3600)
     (* (time-of-day-minutes t) 60)
     (time-of-day-seconds t)))
