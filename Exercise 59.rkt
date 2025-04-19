;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 59|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 59. Finish the design of a world program that simulates the traffic
; light FSA. Here is the main function:
;   TrafficLight -> TrafficLight
;   simulates a clock-based American traffic light
;   (define (traffic-light-simulation initial-state)
;     (big-bang initial-state
;       [to-draw tl-render]
;       [on-tick tl-next 1]))
; The function’s argument is the initial state for the big-bang expression,
; which tells DrRacket to redraw the state of the world with tl-render and to
; handle clock ticks with tl-next. Also note that it informs the computer that
; the clock should tick once per second.
; Complete the design of tl-render and tl-next. Start with copying TrafficLight,
; tl-next, and tl-render into DrRacket’s definitions area.
;
; Here are some test cases for the design of the latter:
;   (check-expect (tl-render "red") image)
;   (check-expect (tl-render "yellow") image)
; Your function may use these images directly. If you decide to create images
; with the functions from the 2htdp/image teachpack, design an auxiliary
; function for creating the image of a one-color bulb. Then read up on the
; place-image function, which can place bulbs into a background scene.

(define WIDTH 56)
(define HEIGHT 26)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define Y-COORD (/ HEIGHT 2))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl-next cs)
  (cond [(string=? cs "red") "green"]
        [(string=? cs "yellow") "red"]
        [(string=? cs "green") "yellow"]))

(define (create-bulb current-state color)
  (circle (/ HEIGHT 6) (if (string=? current-state color) "solid" "outline") color))

; TrafficLight -> Image
; renders the current state cs as an image
(define (tl-render current-state)
  (place-image (create-bulb current-state "red")
               (* 1/4 WIDTH) Y-COORD
               (place-image (create-bulb current-state "yellow")
                            (* 2/4 WIDTH) Y-COORD
                            (place-image (create-bulb current-state "green")
                                         (* 3/4 WIDTH) Y-COORD
                                         BACKGROUND))))
               
; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))
;(traffic-light-simulation "red")