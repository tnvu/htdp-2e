;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 39-43|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 39. Good programmers ensure that an image such as CAR can be enlarged
; or reduced via a single change to a constant definition. Good programmers
; establish a single point of control for all aspects of their programs, not
; just the graphical constants. Several chapters deal with this issue. We
; started the development of our car image with a single plain definition:
;   (define WHEEL-RADIUS 5)
; The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence,
; changing WHEEL-RADIUS from 5 to 10 doubles the size of the car image. This
; kind of program organization is dubbed single point of control, and good
; design employs this idea as much as possible.
; Develop your favorite image of an automobile so that WHEEL-RADIUS remains the
; single point of control.

(define WHEEL-RADIUS 5)
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-RADIUS (/ WHEEL-RADIUS 2) "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define BODY (above (rectangle (* 4 WHEEL-RADIUS) WHEEL-RADIUS "solid" "red")
                    (rectangle (* 7 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red")))
(define CAR (underlay/align/offset "middle" "bottom" BODY 0 WHEEL-RADIUS BOTH-WHEELS))

; Exercise 40. Formulate the examples as BSL tests, that is, using the check-
; expect form. Introduce a mistake. Re-run the tests.

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(define MOVEMENT 3)
(define (tock cw)
  (+ cw MOVEMENT))

(check-expect 23 (tock 20))
(check-expect 81 (tock 78))

; Exercise 41. Finish the sample problem and get the program to run. That is,
; assuming that you have solved exercise 39, define the constants BACKGROUND and
; Y-CAR. Then assemble all the function definitions, including their tests. When
; your program runs to your satisfaction, add a tree to the scenery. We used
;   (define tree
;     (underlay/xy (circle 10 "solid" "green")
;                  9 15
;                  (rectangle 2 20 "solid" "brown")))
; to create a tree-like shape. Also add a clause to the big-bang expression that
; stops the animation when the car has disappeared on the right side.

(define tree (underlay/xy (circle 10 "solid" "green")
                          9 5
                          (rectangle 2 20 "solid" "brown")))
(define BACKGROUND (overlay/align "middle" "middle"
                                  tree
                                  (empty-scene (* 10 (image-width CAR))
                                               (* 2 (image-height CAR)))))
(define Y-CAR (- (image-height BACKGROUND) (/ (image-height CAR) 2)))

; WorldState -> WorldState
; place the right most edge of the car cw pixels from th left edge of the
; BACKGROUND
(define (render cw)
  (place-image CAR (- cw (/ (image-width CAR) 2)) Y-CAR BACKGROUND))

; WorldState -> boolean
; returns true if the world should stop
(define (end? cw)
  (> (- cw (image-width CAR) MOVEMENT) (image-width BACKGROUND)))

(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-tick tock]
    [stop-when end?]))

; Exercise 42. Modify the interpretation of the sample data definition so that a
; state denotes the x-coordinate of the right-most edge of the car.

; Exercise 43. Let’s work through the same problem statement with a time-based
; data definition:
;    An AnimationState is a Number.
;    interpretation the number of clock ticks
;    since the animation started
; Like the original data definition, this one also equates the states of the
; world with the class of numbers. Its interpretation, however, explains that
; the number means something entirely different.
; Design the functions tock and render. Then develop a big-bang expression so
; that once again you get an animation of a car traveling from left to right
; across the world’s canvas.
; 
; How do you think this program relates to animate from Prologue: How to
; Program?
; Use the data definition to design a program that moves the car according to a
; sine wave. (Don’t try to drive like that.)

; WorldState -> WorldState
; number of clock ticks since animation started
(define (tock43 cw) (add1 cw))

(define (render43 cw)
  (place-image CAR
               (- cw (/ (image-width CAR) 2))
               (+ Y-CAR (* 2 WHEEL-RADIUS (sin cw)))
               BACKGROUND))

(define (main43 ws)
  (big-bang ws
    [on-tick tock43]
    [to-draw render43]
    [stop-when end?]))

; (animate ...) is a simplified version of big-bang