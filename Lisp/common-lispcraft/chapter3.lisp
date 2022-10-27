;; Excercises for Chapter 3 Common Lispcraft

;; 1) computes the area of a circle given its radius
(defun area-of-circle (r)
  (* pi (* r r)))

;; 2) yearly interest rates are 10%, compute the monthly payment on a loan of a given amount
(defun monthly-payment (loan-amount)
  (setq interest-rate 10) ;; yearly interest rate of 10%
  (setq percentage-interest-rate (/ interest-rate 100))
  (setq monthly-interest-rate (/ percentage-interest-rate 12))
  (setq monthly-payment (* monthly-interest-rate loan-amount)) monthly-payment)

;; 3) same as above but with a global variable
(setq *interest-rate* 10)
(defun monthly-paymentg (loan-amount)
  (setq percentage-interest-rate (/ *interest-rate* 100))
  (setq monthly-interest-rate (/ percentage-interest-rate 12))
  (setq monthly-payment (* monthly-interest-rate loan-amount)) monthly-payment)

;; 4) Calculate Euclidean distance between points (x1, y1) (x2, y2)
(defun euclidean-distance (points1 points2)
  (setq x1 (car points1))
  (setq x2 (car points2))
  (setq y1 (cadr points1))
  (setq y2 (cadr points2))
  (setq diff-xs (- x1 x2))
  (setq diff-ys (- y1 y2))
  (sqrt (+ (* diff-xs diff-xs) (* diff-ys diff-ys))))

;; 5) Rename car/cdr to head and tail
(defun head (l)
  (car l))

(defun tail (l)
  (cdr l))

;; 6) Switch elements in list
(defun switch (l)
  (append '() (cdr l) (list (car l))))

;; 7)
(setq *basis* 100)
(defun normalize (v)
  (/ v *basis*))

;; Changing *basis* to a locally-scoped variable in n-percentage would have no effect
;; as the parameter is not passed to normalize.
(defun n-percentage (a b *basis*)
  (/ a (normalize b)))
