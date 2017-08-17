(* CS-355     Assignment-5     Vargha Hokmran *)
(*
This Assignment contains 10 questions, and the answers are coded in Standard ML.
The code and the test cases has been successfully tested on SML of New Jersey.
There are some test cases are provided in this document, but the function also work with the test cases inside the assignment sheet. Copy and paste each test ok in your SML terminal, or simply use "use" command to run them all at once.
*)
(* 1 *)
	print ("\n----Number 1:\n");
	is_member (2,[1,3,2,4,5,6,7]);
	is_member (111,[1,3,2,4,5,6,7]);

(* 2 *)
	print ("\n----Number 2:\n");
	intersect ([1,2,3,4],[3,4,1,5,7,9,10]);
	intersect ([1,2],[3,4]);
	
(* 3 *)
	print ("\n----Number 3:\n");
	get_nth([1,2,3],3);
	get_nth(["a","b","c","d","e"],2);
	
(* 4 *)
	print ("\n----Number 4:\n");
	reach_sum ([1,2,3,4],6);
	reach_sum ([1,2,3,4],100);
(* 5 *)
	print ("\n----Number 5:\n");
	cumulative_sum ([12, 27, 13]);
	
(* 6 *)
	print ("\n----Number 6:\n");
	longest_string (["hi","hello","Hi, my name is Vargha.","bye"]);

(* 7 *)
	print ("\n----Number 7:\n");
	filter (fn (x) => (x>3)) [1,2,3,45,67];
	filter (fn (x) => (x=1)) [1,2,3,45,67];

(* 8 *)
	print ("\n----Number 8:\n");
	perms ([1]);
	perms ([1, 2]);
	perms ([1, 2, 3]);
	
(* 9 *)
	print ("\n----Number 9:\n");
	quicksort (fn (x,y) => (x <= y)) [3, 2, 1, 2];
	quicksort (fn (x,y) => (x >= y)) [3, 2, 1, 2];
	
(* 10 *)
	print ("\n----Number 10:\n");
	val tree = Node(Node(Leaf 1, Leaf 2), Node (Leaf 3, Leaf 4));
	foldt (fn(x,y) => if x>y then x else y, 0, tree);
	find_tree(tree, 3);
	find_tree(tree, 7);