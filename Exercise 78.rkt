;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 78|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 78. Provide a structure type and a data definition for representing
; three-letter words. A word consists of lowercase letters, represented with the
; 1Strings "a" through "z" plus #false. Note This exercise is a part of the
; design of a hangman game; see exercise 396.

; A three-letter-word consists of lowercase letters [a-z], and #false
; -first: [a-z, #false], first letter
; -second: [a-z, #false], second letter
; -third: [a-z, #false], third letter
(define-struct three-letter-word [first second third])