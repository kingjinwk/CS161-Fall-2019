; test comment!
; hw2.lsp by Jinwoo Kwak

;DFS - performs a depth-first search of a tree, right-first
(defun DFS (TREE)
	;if the tree is nil, return nil
	(cond ((null TREE) nil)
	;If the tree is an atom, just return the number
		((atom TREE) (list TREE))
	;If not, DFS on the right of the tree and append it to the left of the tree
		(t (append (DFS (rest TREE)) (DFS (first TREE)) ) )
	)
)


;LDS - limited depth first search, takes a tree TREE and outputs right -> left, for depth DEPTH.
(defun LDS (TREE DEPTH)
	;if the tree is null, return nil
	(cond ((null TREE) nil)
	;if the tree is an atom, return the atom, as a list
	((atom TREE) (list TREE))
	;if the desired depth is zero, of a tree that is NOT an atom, return nil (the node has no value)
	((= DEPTH 0) nil)
		;If the desired depth is NOT zero and the TREE is not an atom or null, call LDS for rest of the tree
		;and call LDS for the first of the tree. append the two together
		(t (append (LDS (rest TREE) DEPTH) (LDS (first TREE) (- DEPTH 1)))) 
	)
)

;DFID - performs a depth-first iterative-search of a tree, right-first
(defun DFID (TREE DEPTH)
	(cond ((= DEPTH 0) nil)
	(t (append (DFID TREE (- DEPTH 1)) (LDS TREE DEPTH)))
	)
)



