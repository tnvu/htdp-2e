;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 83-86|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
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
(define (render ed)
  (overlay/align "left" "center"
                 (beside (render-text (editor-pre ed))
                         CURSOR
                         (render-text (editor-post ed)))
                 BACKGROUND))
(render (make-editor "hello" " world"))

; Exercise 84. Design edit. The function consumes two inputs, an editor ed and a
; KeyEvent ke, and it produces another editor. Its task is to add a
; single-character KeyEvent ke to the end of the pre field of ed, unless ke
; denotes the backspace ("\b") key. In that case, it deletes the character
; immediately to the left of the cursor (if there are any). The function ignores
; the tab key ("\t") and the return key ("\r").
; The function pays attention to only two KeyEvents longer than one letter:
; "left" and "right". The left arrow moves the cursor one character to the left
; (if any), and the right arrow moves it one character to the right (if any).
; All other such KeyEvents are ignored.
; Develop a goodly number of examples for edit, paying attention to special
; cases. When we solved this exercise, we created 20 examples and turned all of
; them into tests.
; Hint Think of this function as consuming KeyEvents, a collection that is
; specified as an enumeration. It uses auxiliary functions to deal with the
; Editor structure. Keep a wish list handy; you will need to design additional
; functions for most of these auxiliary functions, such as string-first,
; string-rest, string-last, and string-remove-last. If you haven’t done so,
; solve the exercises in Functions.

(define (string-first s)
  (if (= 0 (string-length s))
      ""
      (substring s 0 1)))
(check-expect (string-first "") "")
(check-expect (string-first "a") "a")
(check-expect (string-first "abc") "a")

(define (string-rest s)
  (if (= 0 (string-length s))
      ""
      (substring s 1)))
(check-expect (string-rest "") "")
(check-expect (string-rest "a") "")
(check-expect (string-rest "abc") "bc")

(define (string-last s)
  (if (= 0 (string-length s))
      ""
      (substring s (- (string-length s) 1))))
(check-expect (string-last "") "")
(check-expect (string-last "a") "a")
(check-expect (string-last "abc") "c")

(define (string-remove-last s)
  (if (= 0 (string-length s))
      ""
      (substring s 0 (- (string-length s) 1))))
(check-expect (string-remove-last "") "")
(check-expect (string-remove-last "a") "")
(check-expect (string-remove-last "abc") "ab")

(define (edit84 ed ke)
  (cond [(string=? ke "left")
         (make-editor (string-remove-last (editor-pre ed))
                      (string-append (string-last (editor-pre ed))
                                     (editor-post ed)))]
        [(string=? ke "right")
         (make-editor (string-append (editor-pre ed)
                                     (string-first (editor-post ed)))
                      (string-rest (editor-post ed)))]
        [(string=? ke "\b")
         (make-editor (string-remove-last (editor-pre ed))
                      (editor-post ed))]
        [(or (string=? ke "\t") (string=? ke "\r")) ed]
        [(= (string-length ke) 1)
         (make-editor (string-append (editor-pre ed) ke)
                      (editor-post ed))]
        [else ed]))
(check-expect (edit84 (make-editor "hello" "there") "\b")
              (make-editor "hell" "there"))
(check-expect (edit84 (make-editor "hello" "there") "\t")
              (make-editor "hello" "there"))
(check-expect (edit84 (make-editor "hello" "there") "\r")
              (make-editor "hello" "there"))
(check-expect (edit84 (make-editor "hello" "there") " ")
              (make-editor "hello " "there"))
(check-expect (edit84 (make-editor "hello" "there") "left")
              (make-editor "hell" "othere"))
(check-expect (edit84 (make-editor "hello" "there") "right")
              (make-editor "hellot" "here"))
(check-expect (edit84 (make-editor "hello" "there") "up")
              (make-editor "hello" "there"))

; Exercise 85. Define the function run. Given the pre field of an editor, it
; launches an interactive editor, using render and edit from the preceding two
; exercises for the to-draw and on-key clauses, respectively.

(define (run pre)
  (big-bang (make-editor pre "")
    [to-draw render]
    [on-key edit86]))

; Exercise 86. Notice that if you type a lot, your editor program does not
; display all of the text. Instead the text is cut off at the right margin.
; Modify your function edit from exercise 84 so that it ignores a keystroke if
; adding it to the end of the pre field would mean the rendered text is too wide
; for your canvas.
(define (edit86 ed ke)
  (cond [(string=? ke "left")
         (make-editor (string-remove-last (editor-pre ed))
                      (string-append (string-last (editor-pre ed))
                                     (editor-post ed)))]
        [(string=? ke "right")
         (make-editor (string-append (editor-pre ed)
                                     (string-first (editor-post ed)))
                      (string-rest (editor-post ed)))]
        [(string=? ke "\b")
         (make-editor (string-remove-last (editor-pre ed))
                      (editor-post ed))]
        [(or (string=? ke "\t") (string=? ke "\r")) ed]
        [(and (= (string-length ke) 1)
              (< (image-width (render-text (string-append (editor-pre ed)
                                                          ke
                                                          (editor-post ed))))
                 (image-width BACKGROUND)))                              
         (make-editor (string-append (editor-pre ed) ke)
                      (editor-post ed))]
        [else ed]))
; (run "hello world")