;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 94-96|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
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
(define MISSLE (triangle 7 "solid" "red"))
(define MISSLE-SPEED 6)
(define UFO (ellipse 40 20 "solid" "grey"))
(define UFO-SPEED 3)

(overlay/align "middle" "top" UFO
               (overlay/align "middle" "bottom" TANK
                              BACKGROUND))

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 

; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place

; Exercise 95. Explain why the three instances are generated according to the
; first or second clause of the data definition.

; the first clause of the definiation has no missle fired whereas the second
; and third clauses have a missle fired and it's position needs to be tracked
; like all other objects in the game

; Exercise 96. Sketch how each of the three game states could be rendered
; assuming a 200x200 image canvas.

(define (render-aim a)
  (place-image UFO (posn-x (aim-ufo a)) (posn-y (aim-ufo a))
               (place-image TANK
                            (tank-loc (aim-tank a))
                            (- (image-height BACKGROUND)
                               (/ (image-height TANK) 2))
                            BACKGROUND)))

(define (render-fired f)
  (place-image UFO (posn-x (fired-ufo f)) (posn-y (fired-ufo f))
               (place-image MISSLE
                            (posn-x (fired-missile f))
                            (posn-y (fired-missile f))
                            (place-image TANK
                                         (tank-loc (fired-tank f))
                                         (- (image-height BACKGROUND)
                                            (/ (image-height TANK) 2))
                                         BACKGROUND))))

(define (render-sigs s)
  (cond [(aim? s) (render-aim s)]
        [(fired? s) (render-fired s)]))

(render-aim (make-aim (make-posn 10 10)
                      (make-tank 10 10)))

(render-fired (make-fired (make-posn 10 10)
                          (make-tank 10 10)
                          (make-posn 20 20)))