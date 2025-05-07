;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 94|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 94. Draw some sketches of what the game scenery looks like at various
; stages. Use the sketches to determine the constant and the variable pieces of
; the game. For the former, develop physical and graphical constants that
; describe the dimensions of the world (canvas) and its objects. Also develop
; some background scenery. Finally, create your initial scene from the constants
; for the tank, the UFO, and the background.

(define TREE (overlay/xy (triangle 12 "solid" "green")
                         4 7
                         (rectangle 5 10 "solid" "brown")))
(define BACKGROUND (overlay/align "left" "bottom" TREE
                                  (overlay/align "right" "bottom" TREE
                                                 (empty-scene 200 200))))
(define TANK (rectangle 20 20 "solid" "blue"))
(define TANK-SPEED 3)
(define MISSLE (triangle 3 "solid" "red"))
(define MISSLE-SPEED 6)
(define UFO (ellipse 40 20 "solid" "grey"))
(define UFO-SPEED 3)

(overlay/align "middle" "top" UFO
               (overlay/align "middle" "bottom" TANK
                              BACKGROUND))
