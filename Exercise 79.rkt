;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 79|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 79. Create examples for the following data definitions:
; A Color is one of: 
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"
; Note DrRacket recognizes many more strings as colors. End
;
; H is a Number between 0 and 100.
; interpretation represents a happiness value
;
; (define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)
; Is it a good idea to use a field name that looks like the name of a predicate?
;
; (define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; Add an interpretation to this data definition, too.
;
; A Weapon is one of: 
; — #false
; — Posn
; interpretation #false means the missile hasn't 
; been fired yet; a Posn means it is in flight
; The last definition is an unusual itemization, combining built-in data with a
; structure type. The next chapter deals with such definitions in depth.

; Color: "white", "yellow", "orange", "green", "red", "blue", "black"
; H: 0, 100, 38, 53
; Person: (make-person "first" "last" #true), (make-person "f" "l" #false)
;   It can be a good idea to use a field name that looks like the name of a
;   predicate
; Dog: (make-dog (make-person "dog" "owner" #false) "Rufus" 1 100)
; - interpretation: Dog has a Person owner, a name, an age,
;                   and a level of happiness
; Weapon: (make-weapon (make-posn 0 0)), (make-weapon #false)
