(* CS-355     Assignment-5     Vargha Hokmran *)

(* 1. Write a function is_member that takes two arguments and returns true if the first argument is a member of the second argument. *)
fun is_member (a,l) =
	if null l
	then false
	else
		if hd(l)=a
		then true
		else is_member (a, tl(l))
		
(* 2. Write a function intersect that takes two lists and returns the intersection of two lists. Each value should appear in the output list only once. *)
fun intersect ([],[]) = []
	| intersect (l1,[]) = []
	| intersect (l1,l2) =
	if is_member(hd(l2), l1)
	andalso	(is_member(hd(l2), tl(l2)) = false)	(* if the element is not repetitive *)
	then hd(l2)::intersect(l1, tl(l2))
    else intersect(l1, tl(l2));
	
(* 3. Write a function get_nth that takes an int list (xs : int list) and an int (n : int) and returns the nth element of xs. Take into account the case where xs may have too few elements; your function may return NONE for such lists and return SOME x for lists having enough elements, where x is the nth element of xs. *)
fun len(l) =
	case l of
		[] => 0
	 | (_::l') => 1 + len(l')
	 
fun get_nth (l, n) = 
	if len(l)<n orelse n<1
	then NONE
	else
		if (1=n)
		then SOME (hd(l))
		else
		get_nth (tl(l), n-1)


(* 4. Write a function reach_sum that takes an int (x : int) as the sum, which must be positive, and an int list (xs : int list) of positive numbers. You should return an int (n : int) such that the sum of the first n elements is less than or equal x, but the sum of the first n+1 elements is greater than x. Take into account the case where the sum of the entire list is less than x; your function may return NONE for such lists and return SOME n for lists sum to more than x. *)
fun reach_sum (xs, s) =
	let fun helper (xs, s, ind) =
		case xs of
			[] => NONE
			| x::xs' => if x>s then SOME ind else helper (xs', s-x, ind+1)
	in
		if (s>0) then helper (xs,s,0) else NONE
	end


(* 5. Write a function cumulative_sum that takes an int list and returns an int list of the partial sums of the numbers in the list. *)
fun cumulative_sum (l) =
    let
      fun cumalative_sum' [] acc  = rev acc
        | cumalative_sum' [x] acc = rev (x::acc)
        | cumalative_sum' (x :: y :: l) acc = cumalative_sum' (y+x :: l) (x :: acc)
    in
      cumalative_sum' l []
    end
	
(* 6. Write a function longest_string that takes a string list and returns the longest string in the list. If the list is empty, return “” (i.e., empty string). In the case of a tie, return the string closest to the beginning of the list.
- longest_string ([“abc”, “hello”, “car”, “apple”]) -> “hello”
- longest_string ([]) -> “” *)
fun longest_string (l: string list) =
	List.foldl (fn (x,max) => if String.size(x) > String.size(max) then x else max) "" l
	
(* 7. Write a function filter that takes as its first argument a one-argument function, called a predicate, which returns true or false, and as its second argument a list. It returns a list of all elements in the second argument that satisfy that predicate. The elements must appear in the result in the same order that they appear in the original list. *)
(*fun filter (f, xs) =
	let fun aux (b, acc) =
		case b of
		[] => acc
		| y::b' => if f y
			then aux (b', acc @ [y])
			else aux (b', acc)
	in
		aux (xs, [])
	end*)
fun myFilter pred nil = nil
| myFilter pred (x::xs) =
	if pred x then
	x :: (myFilter pred xs)
    else
	myFilter pred xs;

		
(* 8. Write a function perms that takes an int list, and returns a list of int lists, each of the sublists being one of the permutations. The permutations may be in any order. *)
fun map (f,xs) =
	case xs of
	[] => []
	| x::xs' => (f x)::(map(f,xs'))

fun interleave x [] = [[x]]
| interleave x (h::t) =
	(x::h::t)::(List.map(fn l => h::l) (interleave x t))

fun perms nil = [[]]
| perms (h::t) =
	List.concat( List.map (fn l => interleave h l) (perms t))
	
(* 9. Write a quicksort function takes as its first argument a two-argument function called a comparator and as its second argument a list. For any pair the comparator returns true or false. The function quicksort returns a list consisting of the members of its second argument, ordered so that the comparator returns true on adjacent members. *)
(*fold (fn(x,y) => y>10 andalso x, true, [1,3,11,22]);*)
fun quicksort f []  = []
| quicksort f (pivot::rest) =
	let fun split([], b, c) =
		quicksort f b @ [pivot] @ quicksort f c
	| split(x::a, b, c) =
		if f(x, pivot)
		then split(a, x::b, c)
		else split(a, b, x::c)
	in split(rest, [], [])
	end;

(* 10. Define an ML datatype named intTree for binary trees containing values of type int where the data is only at the leaves of the tree. Write a search function that takes an intTree and an int and returns true if the int is in the intTree and false otherwise. *)
datatype intTree = Leaf of int | Node of intTree * intTree;

(*val tree = Node(Node(Leaf 1, Leaf 2), Node (Leaf 3, Leaf 4))*)

fun foldt (f, acc,tr) =
	case tr of
		Leaf x => f (acc, x)
		| Node(l, r) => let val ans_l = foldt (f, acc, l) in foldt(f, ans_l, r) end
		
fun find_tree (tr, e)=
	foldt (fn(x,y) => x orelse y=e, false, tr)