;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 26|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 26. What do you expect as the value of this program:
;   (define (string-insert s i)
;     (string-append (substring s 0 i)
;                    "_"
;                    (substring s i)))
;
; (string-insert "helloworld" 6)
; Confirm your expectation with DrRacket and its stepper.

(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))

(string-insert "helloworld" 6)
; (string-append (substring "helloworld" 0 6)
;                "_"
;                (substring "helloworld" 6))
; (string-append "hellow"
;                "_"
;                (substring "helloworld" 6))
; (string-append "hellow"
;                "_"
;                "orld")
; "hellow_orld"
