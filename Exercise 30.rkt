;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 30|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 30. Define constants for the price optimization program at the movie
; theater so that the price sensitivity of attendance (15 people for every 10
; cents) becomes a computed constant.

(define TICKET_PRICE_INITIAL 5.00)
(define DEMAND_INITIAL 120)
(define TICKET_PRICE_DELTA 0.10)
(define DEMAND_DELTA 15)
(define PRICE_SENSITIVITY (/ DEMAND_DELTA TICKET_PRICE_DELTA))

(define (attendees ticket-price)
  (- DEMAND_INITIAL
     (* PRICE_SENSITIVITY (- ticket-price TICKET_PRICE_INITIAL))))
