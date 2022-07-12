;;;; Some use cases to help learn CLISP.

(defun old-enough (age)
  "Tests whether a user is old enough to drive"
  (if (<= age 17)
      (format t "You are too young to drive~%")
      (format t "You are old enough to drive~%")))

(old-enough 16)
(old-enough 42)


(defun has-documents (license insurance)
  "Tests whether a user has the necessary documents to drive"
  (if (and (eq license t) (eq insurance t))
    (format t "You have the necessary documents to drive~%")
    (format t "You need both a license and insurance to drive~%")))

(has-documents t t)
(has-documents t Nil)


(defun fill-tank (litres cost)
  (format t "Cost=$~d (~d litres at $~d)~%" (* litres cost) litres cost))

(fill-tank 50 2.98)

(defvar *side* nil)
(defun drive-side (country)
  (cond ((eq country 'uk) (setf *side* 'left)
	 (print "In the UK drive on the left side of the road"))
	((eq country 'france) (setf *side* 'right)
	 (print "In France drive on the right side of the road"))))

;; note case sensitivity doesn't play a role
(drive-side 'UK)
(print *side*)
(drive-side 'FRANCE)
(print *side*)

(defun get-country-of-origin (country)
  "Uses `case` to perform branching."
  (case country
    ((Germany)   (print "Volkswagen, BMW, Opel, Audi"))
    ((US)        (print "Ford, Dodge, Chevloret"))
    ((UK)        (print "Jaguar, Vauxhall, Lotus"))
    ((Japan)     (print "Subaru, Nissan, Mitsubishi, Honda"))
    (otherwise   (print "No records found"))))

(get-country-of-origin 'Japan)
(get-country-of-origin 'Germany)
(get-country-of-origin 'France)
