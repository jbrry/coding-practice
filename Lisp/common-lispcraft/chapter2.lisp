;; Excercises for Chapter 2 Common Lispcraft

;; 1) find 'x in the following:
(caddr '(a b x d))
(car (cadadr '(a (b (x d)))))
(caadr (cadaar '(((a (b (x) d))))))

;; 2) build the above lists using cons
(cons 'a (cons 'b (cons 'x (cons 'd nil))))
(cons 'b (cons 'x (cons 'd nil)))(cons 'a (cons (cons 'b (cons (cons 'x (cons 'd nil)) nil)) nil))
(cons (cons (cons 'a (cons (cons 'b (cons (cons 'x nil) (cons 'd nil))) nil)) nil) nil)

;; 3)
(length '(a b x d))
(length '(a (b (x d))))
(length '(((a (b (x) d)))))

;; 4)
(setq x '(a b c))
(append x x) ;; -> (A B C A B C)

;; 5) define ''(a) using quote
(quote (quote (a)))
(type-of (quote (quote (a))))
(type-of ''(a))

;; 6)
(setq x 'y)
(set x '(1 2 3))

;; 7)
(car (setq x '(a b c)))
(car '(setq x '(a b c)))

;; 8)
(caadr (cadr '(a '(b (c)))))
(cadr '(a '(b (c))))
(caadr '(b (c)))
