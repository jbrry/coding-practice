;; readable version
(defun foofizzbuzzbar()
    (loop as n from 1 to 1000 do
          (let ((a (= 0 (mod n 2))); Foo
		(b (= 0 (mod n 3))); Fizz
		(c (= 0 (mod n 5))); Buzz
		(d (= 0 (mod n 7)))); Bar
            (cond
	     ((and a b c d) (format t "FooFizzBuzzBar~%"))
	     ((and a b c)   (format t "FooFizzBuzz~%"))
	     ((and a b d)   (format t "FooFizzBar~%"))
	     ((and a c d)   (format t "FooBuzzBar~%"))
	     ((and a c)     (format t "FooBuzz~%"))
	     ((and a b)     (format t "FooFizz~%"))
	     ((and a d)     (format t "FooBar~%"))
	     ((and b c d)   (format t "FizzBuzzBar~%"))
	     ((and b d)     (format t "FizzBar~%"))
	     ((and b c)     (format t "FizzBuzz~%"))
	     ((and c d)     (format t "BuzzBar~%"))
	     (a (format t "Foo~%"))
	     (b (format t "Fizz~%"))
	     (c (format t "Buzz~%"))
	     (d (format t "Bar~%"))
	     (t (format t "~d~%" n))))))
;(foofizzbuzzbar)

(loop as n from 1 to 1000 do(let ((a (= 0 (mod n 2)))(b (= 0 (mod n 3)))(c (= 0 (mod n 5))) (d (= 0 (mod n 7))))(cond ((and a b c d)(format t "FooFizzBuzzBar~%"))((and a b c)(format t "FooFizzBuzz~%"))((and a b d)(format t "FooFizzBar~%"))((and a c d)(format t "FooBuzzBar~%"))((and a c) (format t "FooBuzz~%"))((and a b)(format t "FooFizz~%"))((and a d) (format t "FooBar~%"))((and b c d)(format t "FizzBuzzBar~%"))((and b d)(format t "FizzBar~%"))((and b c)(format t "FizzBuzz~%"))((and c d)(format t "BuzzBar~%"))(a (format t "Foo~%"))(b (format t "Fizz~%"))(c (format t "Buzz~%"))(d (format t "Bar~%"))(t (format t "~d~%" n)))))
