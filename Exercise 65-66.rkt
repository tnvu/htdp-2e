;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 65-66|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 65. Take a look at the following structure type definitions:
; (define-struct movie [title producer year])
; (define-struct person [name hair eyes phone])
; (define-struct pet [name number])
; (define-struct CD [artist title price])
; (define-struct sweater [material size producer])
; Write down the names of the functions (constructors, selectors, and predicates) that each introduces.

(define-struct movie [title producer year])
;(make-movie title producer year)
;(movie-title movie)
;(movie-producer movie)
;(movie-year movie)
;(movie? movie)

(define-struct person [name hair eyes phone])
;(make-person name hair eyes phone)
;(person-name person)
;(person-hair person)
;(person-eyes person)
;(person-phone person)
;(person? person)

(define-struct pet [name number])
;(make-pet name number)
;(pet-name pet)
;(pet-number pet)
;(pet? pet)

(define-struct CD [artist title price])
;(make-CD artist title price)
;(CD-artist CD)
;(CD-title CD)
;(CD-price CD)

(define-struct sweater [material size producer])
;(make-sweater material size producer)
;(sweater-material sweater)
;(sweater-size sweater)
;(sweater-producer sweater)
;(sweater? sweater)

; Exercise 66. Revisit the structure type definitions of exercise 65. Make
; sensible guesses as to what kind of values go with which fields. Then create
; at least one instance per structure type definition.

(make-movie "Idiocracy" "Mike Judge" 2006)
(make-person "Thien" "Black" "Brown" "212-555-1234")
(make-pet "Clifford" "212-555-1234")
(make-CD "Green Day" "American Idiot" 12.99)
(make-sweater "cotton" "M" "Uniqlo")
