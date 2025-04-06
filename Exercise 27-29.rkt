;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 27-29|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 27. Our solution to the sample problem contains several constants in
; the middle of functions. As One Program, Many Definitions already points out,
; it is best to give names to such constants so that future readers understand
; where these numbers come from. Collect all definitions in DrRacket’s
; definitions area and change them so that all magic numbers are refactored into
; constant definitions.

(define DEMAND_INITIAL 120)
(define TICKET_PRICE_INITIAL 5.00)
(define DEMAND_DECREASE 15)
(define TICKET_PRICE_INCREASE 0.10)
;(define FIXED_COSTS 180.00)
;(define VARIABLE_COST 0.04)
(define FIXED_COSTS 0.00)
(define VARIABLE_COST 1.50)

(define (attendees ticket-price)
  (- DEMAND_INITIAL
     (* (/ (- ticket-price TICKET_PRICE_INITIAL) TICKET_PRICE_INCREASE)
        DEMAND_DECREASE)))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))
(define (cost ticket-price)
  (+ FIXED_COSTS (* VARIABLE_COST (attendees ticket-price))))
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

; Exercise 28. Determine the potential profit for these ticket prices: $1, $2,
; $3, $4, and $5. Which price maximizes the profit of the movie theater?
; Determine the best ticket price to a dime.
(profit 1.00) ; 511.20
(profit 2.00) ; 937.20
(profit 3.00) ; 1063.2
(profit 4.00) ; 889.20
(profit 5.00) ; 415.20
; Best ticket price
(profit 2.50) ; 1037.70
(profit 2.60) ; 1048.80
(profit 2.70) ; 1056.90
(profit 2.80) ; 1062.00
(profit 2.90) ; 1064.10
(profit 2.93) ; 1064.15

; Exercise 29. After studying the costs of a show, the owner discovered several
; ways of lowering the cost. As a result of these improvements, there is no
; longer a fixed cost; a variable cost of $1.50 per attendee remains.
;
; Modify both programs to reflect this change. When the programs are modified,
; test them again with ticket prices of $3, $4, and $5 and compare the results.

(define (profit2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 1.50
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(profit 3) ; 630.00
(profit 4) ; 675.00
(profit 5) ; 420

(profit2 3) ; 630.00
(profit2 4) ; 675.00
(profit2 5) ; 420.00