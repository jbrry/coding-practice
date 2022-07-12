;;;; Some basic CLISP utilities.

(print "Let's run a very simple program!")

(defun all-plus-one (a b c)
  "Adds all elements and 1"
  (+ 1 (+ a b c)))

;; Define some global variables and pass them to a function
(defvar *a* 1)
(defvar *b* 2)
(defvar *c* 3)
(all-plus-one *a* *b* *c*); returns 7

;; Define some local variables using `let`
(let ((a 10)
      (b 20))
  (+ a b)); returns 30

;; *a* *b* are still using the global variables
(+ *a* *b*); returns 3

(defun print-stuff (a)
  (message "%s is writing something" a))
(print-stuff 'Bob)

(defun traffic-lights ()
  (let ((a "red")
	(b "orange")
	(c "green"))
    (message "%s means stop, %s means slow down and %s means proceed." a b c)))
(traffic-lights)










