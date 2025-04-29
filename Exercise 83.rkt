;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 83|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 83. Design the function render, which consumes an Editor and produces
; an image.
; The purpose of the function is to render the text within an empty scene of
; image pixels. For the cursor, use a image red rectangle and for the strings,
; black text of size 16.
; Develop the image for a sample string in DrRacket’s interactions area. We
; started with this expression:
;   (overlay/align "left" "center"
;                  (text "hello world" 11 "black")
;                  (empty-scene 200 20))
; You may wish to read up on beside, above, and such functions. When you are
; happy with the looks of the image, use the expression as a test and as a guide
; to the design of render.

(define FONTSIZE 16)
(define FONTCOLOR "black")
(define CURSOR (rectangle 2 FONTSIZE "solid" "red"))
(define BACKGROUND (empty-scene 200 20))

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t


(define (render-text s)
  (text s FONTSIZE FONTCOLOR))
(define (render editor)
  (overlay/align "left" "center"
                 (beside (render-text (editor-pre editor))
                         CURSOR
                         (render-text (editor-post editor)))
                 BACKGROUND))
(render (make-editor "hello" " world"))