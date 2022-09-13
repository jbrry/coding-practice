;; For each integer argument, print the integer spelled out in English.
;; 748 = "seven hundred and forty-eight".
;; The integers will be in the range of 0 (zero) to 1,000 (one thousand) inclusive.

(defvar one-hash (make-hash-table :test #'equal))
(setf (gethash "0" one-hash) "zero")
(setf (gethash "1" one-hash) "one")
(setf (gethash "2" one-hash) "two")
(setf (gethash "3" one-hash) "three")
(setf (gethash "4" one-hash) "four")
(setf (gethash "5" one-hash) "five")
(setf (gethash "6" one-hash) "six")
(setf (gethash "7" one-hash) "seven")
(setf (gethash "8" one-hash) "eight")
(setf (gethash "9" one-hash) "nine")

(defvar two-hash (make-hash-table :test #'equal))
(setf (gethash "2" two-hash) "twenty")
(setf (gethash "3" two-hash) "thirty")
(setf (gethash "4" two-hash) "forty")
(setf (gethash "5" two-hash) "fifty")
(setf (gethash "6" two-hash) "sixty")
(setf (gethash "7" two-hash) "seventy")
(setf (gethash "8" two-hash) "eighty")
(setf (gethash "9" two-hash) "ninety")

(defvar extra-hash (make-hash-table :test #'equal))
(setf (gethash "10" extra-hash) "ten")
(setf (gethash "11" extra-hash) "eleven")
(setf (gethash "12" extra-hash) "twelve")
(setf (gethash "13" extra-hash) "thirteen")
(setf (gethash "14" extra-hash) "fourteen")
(setf (gethash "15" extra-hash) "fifteen")
(setf (gethash "16" extra-hash) "sixteen")
(setf (gethash "17" extra-hash) "seventeen")
(setf (gethash "18" extra-hash) "eighteen")
(setf (gethash "19" extra-hash) "nineteen")


(defun one-check(n)
  (setq *x* (concatenate 'string "" (gethash n one-hash))))


(defun two-check(n)
  (defvar y "")
  ;; set 0-9 (only gets called from when original number if >100)
  (if (< (parse-integer n) 10)
      (setq *x* (concatenate 'string y (gethash (string (char n 1)) one-hash))))
  ;; set 10
  (if (equal (parse-integer n) 10); 10
      (setq *x* (concatenate 'string y (gethash n extra-hash))))
  ;; set 11-19
  (if (and (> (parse-integer n) 10) (< (parse-integer n) 20))
      (setq *x* (concatenate 'string y (gethash n extra-hash))))
  ;; set 20-99
  (if (and (>= (parse-integer n) 20) (< (parse-integer n) 100))
      (if (equal (parse-integer (substring n 1)) 0); divisible by 10
	  (setq *x* (concatenate 'string "" (gethash (string (char n 0)) two-hash)))
	  (setq *x* (concatenate 'string "" (gethash (string (char n 0)) two-hash) "-" (gethash (string (char n 1)) one-hash))))))
  

(defun three-check(n)
  (setq *y* (concatenate 'string "" (gethash (string (char n 0)) one-hash))); get first part of string
  ;; flat number
  (if (equal (parse-integer (substring n 1 3)) 00)
      (setq *y* (concatenate 'string *y* " hundred"))
      ;; 01-09
      (if (< (parse-integer (substring n 1 3)) 10)
	  (setq *y* (concatenate 'string *y* " hundred and " (one-check (substring n 2 3))))
	  ;; 10-19
	  (if (and (>= (parse-integer (substring n 1 3)) 10) (< (parse-integer (substring n 1 3)) 20))
	      (setq *y* (concatenate 'string *y* " hundred and " (gethash (substring n 1 3) extra-hash)))
	      (setq *y* (concatenate 'string *y* " hundred and " (two-check (substring n 1 3)))))))
  (setq *x* *y*))
  

(defun spelling-numbers (n)
  (defvar *x* "")
  (if (equal (length n) 1)
      (one-check n))
  (if (equal (length n) 2)
      (two-check n))
  (if (equal (length n) 3)
      (three-check n))
  (if (equal (length n) 4)
      (setq *x* "one thousand"))
  (princ *x*)
  (terpri))

(loop for arg in *args*
    do (spelling-numbers arg)
)

