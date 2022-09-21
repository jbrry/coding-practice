(defclass bowling-game ()
  ((total
    :initarg :total    ;; name for slot when initialising
    :initform 0
    :accessor total)   ;; name for slot when accessing
   (rolls
    :initform '()
    :accessor rolls)
   (current-roll
    :initarg :current-roll
    :initform 0
    :accessor current-roll))
  (:documentation "Score a bowling game"))

(defmethod init-rolls ((g bowling-game) placeholder)
  (setf (rolls g) (loop repeat 21 collect placeholder)))


(defmethod roll ((g bowling-game) pins)
  (with-accessors ((rolls rolls)
		   (current-roll current-roll))
      g
    (setf (elt (rolls g) (current-roll g)) pins)
    (setf (current-roll g) (incf (current-roll g)))))

(defmethod display-status ((g bowling-game))
  (with-accessors ((total total)
		   (rolls rolls)
		   (current-roll current-roll))
      g
    (format t "total: ~a, rolls: ~a, current-roll: ~a" total rolls current-roll)))
	
(defun create-game ()
  (make-instance 'bowling-game))


(defmethod sum-of-rolls-in-frame ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (+ (nth frame-idx (rolls g)) (nth (+ frame-idx 1) (rolls g)))))


(defmethod strike-bonus ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (+ (nth (+ frame-idx 1) (rolls g)) (nth (+ frame-idx 2) (rolls g)))))


(defmethod spare-bonus ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (nth (+ frame-idx 2) (rolls g))))


(defmethod is-strike ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
      (eq (nth frame-idx (rolls g)) 10)))


(defmethod is-spare ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (eq (+ (nth frame-idx (rolls g)) (nth (+ frame-idx 1) (rolls g))) 10)))


(defmethod score ((g bowling-game))
  (with-accessors ((total total)
		   (current-roll current-roll))
      g
    (let ((frame-idx 0))
      (loop for frame from 1 to 10 do
	(if (is-strike g frame-idx)
	    (progn
	      (setf (total g) (+ (total g) (strike-bonus g frame-idx) 10))
	      (incf frame-idx 1))
	    (if (is-spare g frame-idx)
		(progn
		  (setf (total g) (+ (total g) (spare-bonus g frame-idx) 10))
		  (incf frame-idx 2))
		(progn
		  (setf (total g) (+ (total g) (sum-of-rolls-in-frame g frame-idx)))
		  (incf frame-idx 2)))))
      (total g)
      )))


(defun test ()
  (let ((x '())
	(game '(3 2 3 7 10 10 10 10 4 3 3 3 3 3 3 7 6)))
  (setq x (create-game))
  (init-rolls x 0)
  (loop for r in game do
    (roll x r))
  (score x)
  (display-status x)))

(describe (make-instance 'bowling-game :total 100))
  
