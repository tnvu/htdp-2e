;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 73-74|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 73. Design the function posn-up-x, which consumes a Posn p and a
; Number n. It produces a Posn like p with n in the x field.
; A neat observation is that we can define x+ using posn-up-x:
;   (define (x+ p)
;     (posn-up-x p (+ (posn-x p) 3)))
; Note Functions such as posn-up-x are often called updaters or functional
; setters. They are extremely useful when you write large programs.

(define (posn-up-x p n)
  (make-posn n (posn-y p)))

; Exercise 74. Copy all relevant constant and function definitions to DrRacket’s
; definitions area. Add the tests and make sure they pass. Then run the program
; and use the mouse to place the red dot.

(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))
 
; A Posn represents the state of the world.
 
; Posn -> Posn 
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot]
    [to-draw scene+dot]))

; Posn -> Image
; adds a red spot to MTS at p
(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))

; Posn -> Posn
; increases the x-coordinate of p by 3
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))
(define (x+ p)
  (posn-up-x p (+ (posn-x p) 3)))

; Posn Number Number MouseEvt -> Posn 
; for mouse clicks, (make-posn x y); otherwise p
(define (reset-dot p x y me)
  (cond [(mouse=? me "button-down") (make-posn x y)]
        [else p]))
(check-expect
 (reset-dot (make-posn 10 20) 29 31 "button-down")
 (make-posn 29 31))
(check-expect
 (reset-dot (make-posn 10 20) 29 31 "button-up")
 (make-posn 10 20))

;(main (make-posn 0 0))
