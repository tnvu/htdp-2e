;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 70|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 70. Spell out the laws for these structure type definitions:
; (define-struct centry [name home office cell])
; (define-struct phone [area number])
; Use DrRacket’s stepper to confirm 101 as the value of this expression:
; (phone-area
;  (centry-office
;   (make-centry "Shriram Fisler"
;     (make-phone 207 "363-2421")
;     (make-phone 101 "776-1099")
;     (make-phone 208 "112-9981"))))

(define-struct centry [name home office cell])
; (centry-name (make-centry name home office cell)) ==> name
; (centry-home (make-centry name home office cell)) ==> home
; (centry-office (make-centry name home office cell)) ==> office
; (centry-cell (make-centry name home office cell)) ==> cell

(define-struct phone [area number])
; (phone-area (make-phone 123 "456-7890")) ==> 123
; (phone-number (make-phone 123 "456-7890")) ==> "456-7890"

(phone-area
 (centry-office
  (make-centry "Shriram Fisler"
               (make-phone 207 "363-2421")
               (make-phone 101 "776-1099")
               (make-phone 208 "112-9981"))))
;(phone-area
; (make-phone 101 "776-1099"))
;101
