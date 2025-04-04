;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 5. Use the 2htdp/image teachpack to create the image of a simple
; boat or tree. Make sure you can easily change the scale of the entire image.

(define scene-length 150)
(define scene (empty-scene scene-length scene-length))
(define trunk (square   (* 0.20 scene-length) "solid" "brown"))
(define tree  (triangle (* 0.75 scene-length) "solid" "green"))

(overlay/align "middle" "bottom"
               (overlay/align/offset "middle" "bottom"
                                     tree
                                     0 (image-height trunk)
                                     trunk)
               scene)
