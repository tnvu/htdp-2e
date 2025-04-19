;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 61|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 61. As From Functions to Programs says, programs must define
; constants and use names instead of actual constants. In this spirit, a data
; definition for traffic lights must use constants, too:
;   (define RED 0)
;   (define GREEN 1)
;   (define YELLOW 2)
;   An S-TrafficLight is one of:
;   – RED
;   – GREEN
;   – YELLOW
; If the names are chosen properly, the data definition does not need an
; interpretation statement.
; S-TrafficLight -> S-TrafficLight
; yields the next state, given current state cs
; (check-expect (tl-next- ... RED) GREEN)
; (check-expect (tl-next- ... YELLOW) RED)
; (define (tl-next-numeric cs)
;   (modulo (+ cs 1) 3))
; (define (tl-next-symbolic cs)
;   (cond
;     [(equal? cs RED) GREEN]
;     [(equal? cs GREEN) YELLOW]
;     [(equal? cs YELLOW) RED]))
; Figure 27: A symbolic traffic light
;
; Figure 27 displays two different functions that switch the state of a traffic
; light in a simulation program. Which of the two is properly designed using the
; recipe for itemization? Which of the two continues to work if you change the
; constants to the following
; (define RED "red")
; (define GREEN "green")
; (define YELLOW "yellow")
; Does this help you answer the questions?
; Aside The equal? function in figure 27 compares two arbitrary values,
; regardless of what these values are. Equality is a complicated topic in the
; world of programming.

; tl-next-symbolic properly designed and would continue to work if the
; constants changed