;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 87|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 87. Develop a data representation for an editor based on our first
; idea, using a string and an index. Then solve the preceding exercises again.
; Retrace the design recipe. Hint if you haven’t done so, solve the exercises in
; Functions.
; Note on Design Choices The exercise is a first study of making design choices.
; It shows that the very first design choice concerns the data representation.
; Making the right choice requires planning ahead and weighing the complexity of
; each. Of course, getting good at this is a question of gaining experience.

(define FONTSIZE 16)
(define FONTCOLOR "black")
(define CURSOR (rectangle 2 FONTSIZE "solid" "red"))
(define BACKGROUND (empty-scene 200 20))

(define-struct editor [str idx])

(define (render-text s)
  (text s FONTSIZE FONTCOLOR))
(define (render ed)
  (overlay/align "left" "center"
                 (beside (render-text (substring (editor-str ed) 0
                                                 (editor-idx ed)))
                         CURSOR
                         (render-text (substring (editor-str ed)
                                                 (editor-idx ed))))
                 BACKGROUND))
;(render (make-editor "" 0))
;(render (make-editor "a" 0))
;(render (make-editor "a" 1))
;(render (make-editor "helloworld" 0))
;(render (make-editor "helloworld" 5))
;(render (make-editor "helloworld" 10))

(define (edit ed ke)
  (cond [(string=? ke "left")
         (make-editor (editor-str ed) (max 0 (- (editor-idx ed) 1)))]
        [(string=? ke "right")
         (make-editor (editor-str ed) (min (+ (editor-idx ed) 1)
                                           (string-length (editor-str ed))))]
        [(string=? ke "\b")
         (make-editor (string-append (substring (editor-str ed) 0 (max 0 (- (editor-idx ed) 1)))
                                     (substring (editor-str ed) (editor-idx ed)))
                      (max 0 (- (editor-idx ed) 1)))]
        [(or (string=? ke "\t") (string=? ke "\r")) ed]
        [(and (= (string-length ke) 1)
              (< (image-width (render-text (string-append (editor-str ed) ke)))
                 (image-width BACKGROUND)))
         (make-editor (string-append (substring (editor-str ed) 0 (editor-idx ed))
                                     ke
                                     (substring (editor-str ed) (editor-idx ed)))
                      (+ 1 (editor-idx ed)))]
        [else ed]))

(define (run pre)
  (big-bang (make-editor pre (string-length pre))
    [to-draw render]
    [on-key edit]))

;(run "Hello World!")