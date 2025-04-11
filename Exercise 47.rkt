;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 47|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 47. Design a world program that maintains and displays a “happiness
; gauge.” Let’s call it gauge-prog, and let’s agree that happiness is a number
; between 0 and 100 (inclusive).
; The gauge-prog program consumes the current level of happiness. With each
; clock tick, the happiness level decreases by 0.1; it never falls below 0
; though. Every time the down arrow key is pressed, happiness decreases by 1/5;
; every time the up arrow is pressed, happiness jumps by 1/3.
; To show the level of happiness, we use a scene with a solid, red rectangle
; with a black frame. For a happiness level of 0, the red bar should be gone;
; for the maximum happiness level of H, the bar should go all the way across the
; scene.
; Note When you know enough, we will explain how to combine the gauge program
; with the solution of exercise 45. Then we will be able to help the cat because
; as long as you ignore it, it becomes less happy. If you pet the cat, it
; becomes happier. If you feed the cat, it becomes much, much happier. So you
; can see why you want to know a lot more about designing world programs than
; these first three chapters can tell you.

(define GAUGE-MIN 0)
(define GAUGE-MAX 100)
(define GAUGE-DECREASE-TICK 0.1)
(define GAUGE-DECREASE-DOWN 1/5)
(define GAUGE-INCREASE-UP 1/3)
(define BACKGROUND (rectangle GAUGE-MAX (/ GAUGE-MAX 2) "outline" "black"))

; WorldState -> Image
; cw is the happiness level [0-100]
(define (render cw)
  (place-image/align (rectangle (* (/ cw GAUGE-MAX) (image-width BACKGROUND)) (image-height BACKGROUND) "solid" "red")
                     0 0 "left" "top"
                     BACKGROUND))

; WorldState -> WorldState
; 0 <= cw <= 100
(define (tock cw)
  (max 0 (min 100 (- cw GAUGE-DECREASE-TICK))))

(define (keypress cw key)
  (cond [(key=? key "down") (- cw (* cw GAUGE-DECREASE-DOWN))]
        [(key=? key "up")   (max 2 (+ cw (* cw GAUGE-INCREASE-UP)))]
        [else cw]))
  
(define (gauge-prog happiness)
  (big-bang happiness
    [to-draw render]
    [on-tick tock]
    [on-key keypress]))
; (gauge-prog 100)