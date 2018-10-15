; test comment!
; hw2.lsp by Jinwoo Kwak

;DFS - performs a depth-first search of a tree, right-first

(defun DFS (TREE)
	;if the tree is nil, return nil
	(cond (null TREE) nil
	;If the tree is an atom, just return the number
		((atom TREE) TREE)
	;if the right is a number, return the number
		((atom (first TREE)) TREE)
	;if the left is a number, return the number
		((atom (second TREE)) TREE)
	;if not, recurse right, then recurse left
		(t (DFS(rest TREE)) (DFS (first TREE)))
	)
)


