;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 76|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 76. Formulate data definitions for the following structure type
; definitions:
; (define-struct movie [title producer year])
; (define-struct person [name hair eyes phone])
; (define-struct pet [name number])
; (define-struct CD [artist title price])
; (define-struct sweater [material size producer])
; Make sensible assumptions as to what kind of values go into each field.

; A movie has a:
; -title: String, name of the movie
; -producer: String, name of the producer
; -year: Number, year the movie was released
(define-struct movie [title producer year])

; A person has a:
; -name: String, name of the person
; -hair: String, color of hair
; -eyes: String, color of eyes
; -phone: String, phone number
(define-struct person [name hair eyes phone])

; A pet has a:
; -name: String, name of pet
; -number: String, phone number of pet's owner
(define-struct pet [name number])

; A CD has a:
; -artist: String, name of artist
; -title: String, name of CD
; -price: Number, price of CD
(define-struct CD [artist title price])

; A sweater has a:
; -material: String, name of material used to produce sweater
; -size: String, size of sweater
; -producer: String, name of producer
(define-struct sweater [material size producer])
