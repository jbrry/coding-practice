(member 1 (member 1 '(4 1 2 1)))

(defun first-list (x)
  (cond ((listp x) (car x) (print "Here's something extra"))))

(setq x '(a b c))
(setq x 'y)
(cond ((listp x) (car x)))


(defun car-atomp (x)
  (cond ((listp x) (atom (car x)))))


(defun cond-example1 (x)
  (cond
    ((listp x) (cons 'a x))
    ((numberp x) (+ 7 x))))


(defun cond-example2 (x)
  (cond
    ((listp x) (setq flag 'list) (cons 'a x))
    ((numberp x) (setq flag 'number) (+ 7 x))))


(defun cond-example3 (x)
  (cond
    ((listp x) (setq flag 'list) (cons 'a x))
    ((numberp x) (setq flag 'number) (+ 7 x))
    (t (setq flag 'neither) nil)))


(defun cond-example4 (x)
  (cond
    ((listp x) (setq flag 'list) (cons 'a x))
    ((numberp x) (setq flag 'number) (+ 7 x))
    ((setq flag 'neither))))

(defun our-adjoin (e l)
  (cond
    ((member e l) l)
    (t (cons e l))))


(defun our-adjoin (e l)
  (if (member e l) l
      (cons e l)))


(defun even-50-100 (x)
  (cond ((numberp x)
     (cond ((evenp x)
	(cond ((> x 49) (< x 101))))))))


;; Chapter 4 Excercises

;; 1
(not (atom '(a b c)))
(member '(y) '(x y z))
(and (setq x 4) (not (numberp x)) (setq x 5))
(or (setq x 4) (not (numberp x)) (setq x 5))
(equal () ' nil)

;; 2
(defun odd-over-1million (x)
  (and (numberp x) (oddp x) (> x 1000000)))

;; 3
(defun multiple-member (x l)
  (if (and (listp l) (member x l))
      (progn
	(setq l (cdr (member x l)))
	(if (and (listp l) (member x l))
	    (setq flag "multiple member")
	    (setq flag "not multiple member")))
      (setq flag "not multiple member")))

;; 4
(defun average-2 (a b)
  (if (and (numberp a) (numberp b))
      (/ (+ a b) 2)))

;; 5
(setq *tolerance* 5)

(defun sufficiently-close (a b)
  (cond ((< (abs (- a b)) *tolerance*))))
