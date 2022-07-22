;; readable version
(defun fizzbuzz()
    (loop as n from 1 to 100 do
          (let ((a (= 0 (mod n 3)))
		(b (= 0 (mod n 5))))
            (cond
              ((and a b) (format t "FizzBuzz~%"))
                (a (format t "Fizz~%"))
                (b (format t "Buzz~%"))
                (t (format t "~d~%" n))))))
(fizzbuzz)

;; golfed version
(loop as n from 1 to 100 do(let((a(= 0(mod n 3)))(b (= 0 (mod n 5))))(cond((and a b) (format t"FizzBuzz~%"))(a(format t"Fizz~%"))(b(format t"Buzz~%"))(t(format t"~d~%"n)))))
