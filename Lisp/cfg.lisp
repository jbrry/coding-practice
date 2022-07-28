;;;; Context-Free Grammar (CFG) Sampled Sentence Generator

#|
For this CFG parser, we will use (and expand) the rules given in Charniak (2016):  
	https://cs.brown.edu/courses/csci1460/assets/files/parsing.pdf
|#

;;; make a hash table to store the R (rules)
;;; a rule maps a parent nonterminal to children (which can either be a nonterminal or a terminal)
(setq *rules* (make-hash-table))
(setf (gethash 'DT *rules*)  '((the) (a) (this)))
(setf (gethash 'NNP *rules*) '((Sam) (Sandy) (Bob) (Marty)))
(setf (gethash 'NP *rules*)  '((NNP) (DT NN)))
(setf (gethash 'S *rules*)   '((NP VP)))
(setf (gethash 'VBZ *rules*) '((thinks) (likes) (hates) (loves)))
(setf (gethash 'VP *rules*)  '((VBZ S) (VBZ NP)))
(setf (gethash 'NN *rules*)  '((book) (table)))

(defparameter *sentence* '(ROOT)); list to write out terminals
(defparameter *nb-expansions* 0); how many production rules we've applied to nonterminals
(defparameter *allowed-expansions* 100); how many times we're allowed to expand the nonterminals


(defun expand-sentence (d)
  (setf d (list d))
  (setf *sentence* (append *sentence* d)))


(defun derive-tree (d)
  "Checks whether a symbol is part of the grammar rules
  (is a parent nonterminal).
  If it's not, we assume it's a terminal symbol and add this
  to the output string.
  If the symbol is a nonterminal, we iterate over the children
  of the rule (which can either be nonterminals or terminals)
  and check to see if those values are described in the rules
  and call the function recursively until this is no longer the
  case (i.e. we have reached a terminal"
  (if (null (gethash d *rules*)); symbol is not in the rules
      (progn
	;; expand the sentence (unless we have exceeded the allowed number of expansions)
        (unless(> *nb-expansions* *allowed-expansions*)
	  (expand-sentence d))
	(when (>= *nb-expansions* *allowed-expansions*)
	  (expand-sentence 'END)))
      (progn
	(setf d (gethash d *rules*)); set d to children of nonterminal
	(setf d (nth (random (length d)) d)); pick a random rule when more than one is described
	(loop for child in d do
	      (setf *nb-expansions* (+ *nb-expansions* 1)); increment counter
	      (derive-tree child)))))


(defun reset-vars ()
  (setf *sentence* '(ROOT))
  (setf *nb-expansions* 0))


(defun sample-n-sentences (n)
  "Sample a sentence n times"
  (if (= 0 n) nil
      (progn
	(reset-vars)
	(derive-tree 'S); derive the sentence using the S nonterminal
	(print *sentence*)
	(sample-n-sentences (- n 1)))))

(sample-n-sentences 20)
