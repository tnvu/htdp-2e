;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 82|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 82. Design the function compare-word. The function consumes two
; three-letter words (see exercise 78). It produces a word that indicates where
; the given ones agree and disagree. The function retains the content of the
; structure fields if the two agree; otherwise it places #false in the field of
; the resulting word. Hint The exercises mentions two tasks: the comparison of
; words and the comparison of “letters.”

(define-struct three-letter-word [first second third])

; Compares two letters
; Returns letter if they match, otherwise #false
(define (compare-letter x y)
  (if (string=? x y)
      x
      #false))
(check-expect "x" (compare-letter "x" "x"))
(check-expect #false (compare-letter "x" "y"))

; Compares two three-letter words
; Returns a three-letter word with the letter where the two words match,
; otherwise #false where the letters don't match
(define (compare-word w1 w2)
  (make-three-letter-word (compare-letter (three-letter-word-first w1)
                                          (three-letter-word-first w2))
                          (compare-letter (three-letter-word-second w1)
                                          (three-letter-word-second w2))
                          (compare-letter (three-letter-word-third w1)
                                          (three-letter-word-third w2))))
(check-expect (compare-word (make-three-letter-word "a" "b" "c")
                            (make-three-letter-word "a" "b" "c"))
              (make-three-letter-word "a" "b" "c"))
(check-expect (compare-word (make-three-letter-word "a" "b" "c")
                            (make-three-letter-word "a" "b" "z"))
              (make-three-letter-word "a" "b" #false))
(check-expect (compare-word (make-three-letter-word "a" "b" "c")
                            (make-three-letter-word "x" "y" "z"))
              (make-three-letter-word #false #false #false))
