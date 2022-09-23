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


;(defmethod init-rolls ((g bowling-game))
;  (setf (rolls g) (make-list 21 :initial-element 0)))


(defmethod initialize-instance :after ((g bowling-game))
  (setf (rolls g) (make-list 21 :initial-element 0)))


(defmethod roll ((g bowling-game) pins)
  (with-accessors ((rolls rolls)
		   (current-roll current-roll))
      g
    (setf (elt rolls current-roll) pins)
    (incf current-roll)))


(defmethod sum-of-rolls-in-frame ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (+ (nth frame-idx rolls) (nth (+ frame-idx 1) rolls))))


(defmethod strike-bonus ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (+ (nth (+ frame-idx 1) rolls) (nth (+ frame-idx 2) rolls))))


(defmethod spare-bonus ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (nth (+ frame-idx 2) rolls)))


(defmethod is-strike ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
      (= (nth frame-idx rolls) 10)))


(defmethod is-spare ((g bowling-game) frame-idx)
  (with-accessors ((rolls rolls))
      g
    (= (+ (nth frame-idx rolls) (nth (+ frame-idx 1) rolls)) 10)))


(defmethod score ((g bowling-game))
  (with-accessors ((total total))
      g
    (loop with frame-idx = 0
	  for frame from 1 to 10 do
	    (if (is-strike g frame-idx)
		(progn
		  (incf total (+ (strike-bonus g frame-idx) 10))
		  (incf frame-idx 1))
		(if (is-spare g frame-idx)
		    (progn
		      (incf total (+ (spare-bonus g frame-idx) 10))
		      (incf frame-idx 2))
		    (progn
		      (incf total (sum-of-rolls-in-frame g frame-idx))
		      (incf frame-idx 2)))))))


(defmethod display-status ((g bowling-game))
  (with-accessors ((total total)
		   (rolls rolls)
		   (current-roll current-roll))
      g
    (format t "total: ~a, rolls: ~a, current-roll: ~a" total rolls current-roll)))


(defun create-game ()
  (make-instance 'bowling-game))


(defun test ()
  (let ((x '())
	(game '(3 2 3 7 10 10 10 10 4 3 3 3 3 3 3 7 6)))
    (setq x (create-game))
    (loop for r in game do
      (roll x r))
    (score x)
    (describe x)))
