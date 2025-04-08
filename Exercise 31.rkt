;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 31|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 31. Recall the letter program from Composing Functions. Here is how
; to launch the program and have it write its output to the interactions area:
;   > (write-file
;      'stdout
;      (letter "Matthew" "Fisler" "Felleisen"))
; Dear Matthew,
;
; We have discovered that all people with the
; last name Fisler have won our lottery. So, 
; Matthew, hurry and pick up your prize.
;
; Sincerely, 
; Felleisen
; 'stdout
;
; Of course, programs are useful because you can launch them for many different
; inputs. Run letter on three inputs of your choice.
; Here is a letter-writing batch program that reads names from three files and
; writes a letter to one:
;   (define (main in-fst in-lst in-signature out)
;     (write-file out
;                 (letter (read-file in-fst)
;                         (read-file in-lst)
;                         (read-file in-signature))))
; The function consumes four strings: the first three are the names of input
; files and the last one serves as an output file. It uses the first three to
; read one string each from the three named files, hands these strings to
; letter, and eventually writes the result of this function call into the file
; named by out, the fourth argument to main.
; Create appropriate files, launch main, and check whether it delivers the
; expected letter in a given file.

(define (letter first-name last-name signature-name)
  (string-append
   (opening first-name)
   "\n\n"
   (body first-name last-name)
   "\n\n"
   (closing signature-name)))
 
(define (opening first-name)
  (string-append "Dear " first-name ","))
 
(define (body first-name last-name)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " last-name " have won our lottery. So, " "\n"
   first-name ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))


(write-file "Exercise-31-in-fst.dat" "First")
(write-file "Exercise-31-in-lst.dat" "Last")
(write-file "Exercise-31-in-signature.dat" "Signature")

(main "Exercise-31-in-fst.dat"
      "Exercise-31-in-lst.dat"
      "Exercise-31-in-signature.dat"
      "Exercise-31-out.dat")