;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 80|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 80. Create templates for functions that consume instances of the
; following structure types:
; (define-struct movie [title director year])
; (define-struct pet [name number])
; (define-struct CD [artist title price])
; (define-struct sweater [material size color])
; No, you do not need data definitions for this task.

(define-struct movie [title director year])
(define (movie-template m)
  (... (movie-title m) ... (movie-director m) ... (movie-year m)))

(define-struct pet [name number])
(define (pet-template p)
  (... (pet-name p) ... (pet-number p) ...))
  
(define-struct CD [artist title price])
(define (CD-template c)
  (... (CD-artist c) ... (CD-title c) ... (CD-price c)))

(define-struct sweater [material size color])
(define (sweater-template s)
  (... (sweater-matieral s) ... (sweater-size s) ... (sweater-color s)))
