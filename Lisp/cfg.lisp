;;;; Context-Free Grammar (CFG) Sentence Generator

#|
For this CFG parser, we will use the rules given in Charniak (2016):  
	https://cs.brown.edu/courses/csci1460/assets/files/parsing.pdf

|#


;;; make a hash table to store the R (rules)
;;; a rule maps a parent nonterminal to children (which can either be a nonterminal or a terminal)
(setq *rules* (make-hash-table))
(setf (gethash 'DT *rules*)  '((the)))
(setf (gethash 'NNP *rules*) '((Sam) (Sandy)))
(setf (gethash 'NP *rules*)  '((NNP) (DT NN)))
(setf (gethash 'S *rules*)   '((NP VP)))
(setf (gethash 'VBZ *rules*) '((thinks) (likes)))
(setf (gethash 'VP *rules*)  '((VBZ S) (VBZ NP)))
(setf (gethash 'NN *rules*)  '((book)))


;; list to write out terminals
(defparameter expansion '(ROOT))
;(setq *expansion* (append *expansion* '(little lamb)))

(defun derive-tree (y)
  "Checks whether a symbol is part of the grammar rules
  (is a parent nonterminal).
  If it's not, we assume it's a terminal symbol and add this
  to the output string.
  If the symbol is a nonterminal, we iterate over the children
  of the rule (which can either be nonterminals or terminals)
  and check to see if those values are described in the rules
  and call the function recursively until this is no longer the
  case (i.e. we have reached a terminal"
  (if (null (gethash y *rules*)); symbol is not in the rules
      (progn
	(format t "~%adding ~s to string" y))
      (progn
	(setq y (gethash y *rules*)); set y to rule values
	(setq y (nth (random (length y)) y)); pick a random rule when more than one is described. This won't matter for singleton rules
	(format t "~%~s < random choice!" y)
	(loop for c in y do
	      (format t "~%looking up ~s" c) 
	      (derive-tree c)))))
 
(derive-tree 'S)
