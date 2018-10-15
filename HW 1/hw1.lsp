;hw1.lsp Jinwoo Kwak 

;PROBLEM 1:
;	- Three important cases: if the tree is null, return nil, if the tree is a single number, 
;	 	check if that number is equal to N and return accordingly.
;	- Then I want to check to see if the m node of the tree is equal to N, if so return true
;	- I then check to see if the input N is > or < the value of node m. If >, I recursively
;		call my function on the right side of the tree. If <, I recursively call my function
;		on the left side of the tree.
;
;PROBLEM 2:
;	- One important case: If the input tree is an atom, return the tree.
;	- Otherwise, keep recursing to the far left of the tree (where the
;		smallest value is)
;
;PROBLEM 3:
;	- Important cases: If the TREE is an atom, return the TREE
;			list m with first TREE (L) and second TREE (R)
;
;PROBLEM 4:
;	- Important cases: If the LEN is 0, return nil right away
;			If the START is 0, start appending right away
;			If the START is not 0, then we recursively call SUB-LIST until we get to a valid 
;			starting point.
;
;PROBLEM 5:
;	- Important cases: If the list is null, return nil
;		If the list has an even length, the two lists are
;			1. START of L to length of L/2 
;			2. Length of L/2 to End of List 
;		If the list has an odd length, the two lists are
;			1. START of L to length of L + 1 / 2
;			2. Length of L/2 to End of List - 1 / 2 
;
;PROBLEM 6:
;	- Important cases: If the tree has one element, the height is 0
;		- If the height of the left tree is greater than the height of the right tree
;			recurse on the right tree, but add 1 (to keep track of how many heights we went down)
;		- If the height of the right tree is greater than that of the left recurse on the left but add 1
;
;PROBLEM 7:
;	- Important cases: If the length of the input leaves is 1, output the leaf's value as a list
;	-  Use the Split-List function to gather two binary trees and append them together
;
;PROBLEM 8:
;	- Important cases: If the input tree is an atom, simply return that atom as a list.
;	- If not, we will traverse through the entire tree and begin appending each bit onto the 
;		final list.
;
;PROBLEM 9:
;	- Important cases: If E1 and E2 are just numbers, compare them and see if they are the same value
;						If E1 and E2 are nil values, return true since two empty lists are the same
;						
;	- Otherwise check to see if the first value of E1 and E2 are the same and if the rest of E1 and E2 are the same
;
;



; This function takes N (number) which is the value we want to find in the tree, and a tree TREE which is a tree.
(defun TREE-CONTAINS (N TREE) 
	(cond ((null TREE) NIL) 
		  ((atom TREE) (equal TREE N))
		  ((equal (second TREE) N) t) 
		  ((< (second TREE) N) (TREE-CONTAINS N (third TREE))) 
		  ((> (second TREE) N) (TREE-CONTAINS N (first TREE)))
	)
)

; This function takes a tree TREE and finds the minimum of that tree
(defun TREE-MIN (TREE) 
	(cond ((atom TREE) TREE)
		(t (TREE-MIN (first TREE)))
	)
)

; This function takes a tree TREE and prints the tree in preorder form
(defun TREE-ORDER (TREE) 
	(cond ((atom TREE) (list TREE))
	(t (append (TREE-ORDER (second TREE)) (TREE-ORDER (first TREE)) (TREE-ORDER (third TREE)))))
)

; This function takes a list L, and a starting point START and a length LEN. It uses START and LEN to determine which part of the L list to use as a new list
(defun SUB-LIST (L START LEN)
	(cond ((equal LEN 0) nil)
		((equal START 0) (cons (first L) (SUB-LIST (rest L) START (- LEN 1))))
		(t (SUB-LIST (rest L) (- START 1) LEN))
	)
)

; This function takes a list L and splits it into two lists
(defun SPLIT-LIST (L)
	(cond ((null L) (list nil nil))
		((oddp (length L)) 
			(list (SUB-LIST L 0 (/ (+ (length L) 1) 2)) 
				(SUB-LIST L (/ (+ (length L) 1) 2) (/ ( - (length L) 1) 2) )))
		((evenp (length L)) 
			(list (SUB-LIST L 0 (/ (length L) 2)) 
				(SUB-LIST L (/  (length L) 2) ( / (length L) 2 ) )))
	)
)

; This function takes a tree TREE and returns the height of the tree.
(defun BTREE-HEIGHT (TREE) 
	(cond ((numberp TREE) 0) 
		((< (BTREE-HEIGHT (first TREE)) (BTREE-HEIGHT (second TREE))) (+ (BTREE-HEIGHT (second TREE)) 1))
		(t (+ (BTREE-HEIGHT (first TREE)) 1))
	)
)

; This function takes the argument LEAVES and converts it into a binary tree
(defun LIST2BTREE (LEAVES)
	(cond ((equal (length LEAVES) 1) (first LEAVES))
		(t (list (LIST2BTREE (first (SPLIT-LIST LEAVES))) (LIST2BTREE (second (SPLIT-LIST LEAVES))) )
		)
	)
)

; This function takes an argument TREE and converts it into a list
(defun BTREE2LIST (TREE)
	(cond ((atom TREE) (list TREE))
		(t (append (BTREE2LIST (first TREE)) (BTREE2LIST (second TREE))) 
		)
	)
)

; This function takes E1 and E2 which gets compared to see if they are the same
(defun IS-SAME (E1 E2)
	(cond ((and (numberp E1) (numberp E2)) (= E1 E2) )
		((and (null E1) (null E2)) t)
		((and (listp E1) (numberp E2)) nil)
		((and (listp E2) (numberp E1)) nil)
		(t (and (IS-SAME (first E1) (first E2)) (IS-SAME (rest E1) (rest E2))))
	)
)
