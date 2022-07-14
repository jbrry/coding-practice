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

;; rule of thumb: use eq for comparing symbols and equal for comparing everything else.
(eq 'Bob 'Bob)
(equal "Bob" "Bob")
(string-equal "Bob" "Bob")

(equal (list 1 2 3) (list 1 2 3))
(equal (list 1 2 3) '(1 2 3))

;; (if COND THEN ELSE...)
(if (= 4 4)
    (message "they are equal")
    (message "they are not equal"))

;; use `progn` to elaborate on THEN ELSE
(if (= 4 5)
    (progn
      (message "numbers are equal")
      (message "have a good day"))
    (progn
      (message "numbers are not equal")
      (message "try again with equal numbers")))
      
(when (> 2 1)
  (message "2 is greater than 1")); changing the numbers results in a nil

(unless (> 1 2)
  (message "2 will always be greater than 1"))

(null nil)
(null '())
(null ())

(stringp "A")
(stringp 1); not a string
(numberp 1)
(numberp "A"); not a number
(symbolp 'A)
(symbolp "A"); not a symbol

(defun typeof (object)
  "Return a string wit the type of the object given as an argument"
  (cond
    ((numberp object) "number")
    ((stringp object) "string")
    ((functionp object) "function")
    ((symbolp object) "symbol")
    ((listp object) "list")))

(typeof 1)
(typeof "yellow")
(typeof 'print)
(typeof 'b)
(typeof '(1 2 3))
(typeof (list 1 2 3)); create the object using list command
 
(setq my-list '(1 2 3))
(typeof my-list)
(typeof 'my-list); symbol (as we're passing the name of the variable)


(defun print-to (n limit)
  "uses `while` and an incrementor to print up to n"
  (while (< n limit)
    (message "%d" n)
    (setq n (+ n 1))))

(setq n 1)
(print-to n 50)


(defun print-n (n)
  "uses `dotimes` to print to n times"
  (dotimes (iterator n)
    (message "%d" iterator)))

(print-n 10)

(setq my-list '(a b c d))

(car my-list)

(stringp "A")
(stringp 1); not a string
(numberp 1)
(numberp "A"); not a number
(symbolp 'A)
(symbolp "A"); not a symbol

(defun typeof (object)
  "Return a string wit the type of the object given as an argument"
  (cond
    ((numberp object) "number")
    ((stringp object) "string")
    ((functionp object) "function")
    ((symbolp object) "symbol")
    ((listp object) "list")))

(typeof 1)
(typeof "yellow")
(typeof 'print)
(typeof 'b)
(typeof '(1 2 3))
(typeof (list 1 2 3)); create the object using list command
 
(setq my-list '(1 2 3))
(typeof my-list)
(typeof 'my-list); symbol (as we're passing the name of the variable)


(defun print-to (n limit)
  "uses `while` and an incrementor to print up to n"
  (while (< n limit)
    (message "%d" n)
    (setq n (+ n 1))))

(setq n 1)
(print-to n 50)


(defun print-n (n)
  "uses `dotimes` to print to n times"
  (dotimes (iterator n)
    (message "%d" iterator)))

(print-n 10)


(setq my-list '(a b c d))

(car my-list)


(stringp "A")
(stringp 1); not a string
(numberp 1)
(numberp "A"); not a number
(symbolp 'A)
(symbolp "A"); not a symbol

(defun typeof (object)
  "Return a string wit the type of the object given as an argument"
  (cond
    ((numberp object) "number")
    ((stringp object) "string")
    ((functionp object) "function")
    ((symbolp object) "symbol")
    ((listp object) "list")))

(typeof 1)
(typeof "yellow")
(typeof 'print)
(typeof 'b)
(typeof '(1 2 3))
(typeof (list 1 2 3)); create the object using list command
 
(setq my-list '(1 2 3))
(typeof my-list)
(typeof 'my-list); symbol (as we're passing the name of the variable)


(defun print-to (n limit)
  "uses `while` and an incrementor to print up to n"
  (while (< n limit)
    (message "%d" n)
    (setq n (+ n 1))))

(setq n 1)
(print-to n 50)


(defun print-n (n)
  "uses `dotimes` to print to n times"
  (dotimes (iterator n)
    (message "%d" iterator)))

(print-n 10)


(setq my-list '(a b c d))

(car my-list)
(cdr my-list)
(cadr my-list)
(car (cdr my-list))
(eq (cadr my-list) (car (cdr my-list)))


(defun consume-list(list)
  (while list
    (message "%s" (car list)); print first elem of list
    (setq list (cdr list))));  remove first elem of list

(setq a-list '(1 2 3 4 5))
(setq another-list '("a" "b" "c"))
(consume-list a-list)
(consume-list another-list)


(defun nth-element (list n)
  (while (/= n 0); while not-equal-to 0
  (setq list (cdr list))
  (setq n (- n 1)))
  (car list))

(setq new-list '(A B C D E F))
(nth-element new-list 0)
(nth-element new-list 5)

(setcar new-list 'a); set first elem
(setcdr new-list '(b c d e f))
(print new-list)
(nthcdr 5 new-list)


;; car of nth cadr (first element of subset of the list)
(defun nth-element2 (list n)
  (car (nthcdr n list))); shorthand

(nth-element2 new-list 5)


(defun print-dolist (list)
  (dolist (head list); head is the symbol for the iterator, e.g. "i" in for loop
    (print head)))

(print-dolist new-list)    
