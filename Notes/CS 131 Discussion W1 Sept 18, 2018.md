# CS 131 Discussion W1 Sept 18, 2018

## Basic Ocaml Shit

```ocaml
"Hello, World!\n";;
Hello, World!
- : unit = () <--- no information was really given

(*This is a comment*) <----- multiline and nested both work

# let my_value = 5;; <---- declaring variables
val my_value : int = 5 <---- note: you can't change the value after
```

<u>Lists are defined by:</u>

let numbers = [1; 2; 3; 4; 5] <—— nice

- Iteration fast, access slow

- Lists have a head and a tail

```ocaml
0 :: [1; 2; 3] <--- gives a new list [0; 1; 2; 3]
0 :: 1 :: 2 :: [3] <--- gives us [0; 1; 2; 3]
```

<u>Functions:</u>

```ocaml
let average a b=
	(a + b) / 2;;
val average : int -> int -> =<fun>

(*Let binds a function with parameters a and b to name average*)

# let average a b=
 (a +. b) /. 2.0;;
 val average : float -> float -> float = <fun>
 
 # let my_average = average 3 5;;
 Error: This expression has type int but an expression was expected of type float
```

<u>Recursive Functions:</u>

```ocaml
# let rec factorial a = 
	if a  = 1 then else a  * factorial (a-1);;
val factorial : int -> int = <fun>

# factorial 5;;
- : int = 120
```

<u>Local variables in functions:</u>

Also Lambda Functions

```ocaml
# let average a b=  
	let sum = a+.  b in
	sum ./ 2.0
```

```ocaml
# map (fun x-> x * x) [1; 2; 3; 4; 5];;
- : int list = [1; 4; 9; 16; 25]
```

<u>Pattern Matching:</u>

```ocaml
# let is_zero x =
 if x =0 then true else false;;
 
# let is_zero x = match x with
	0 -> true <--- anything that is zero
|	_ -> false;; <--- any other thing that is not 0
```

Can also include conditions using *when* statements:

```ocaml
let rec factorial a  = match a with
	x when x < 2 -> 1
	| x -> x * factorial (x-1);
```



## Homework 1

Only can use *lists* and *pervasives*



pervasives is already loaded, lists I need to load on my own.

Boolean operators: !, &&, ||

<> (only values) is not exactly != (checks references)

Output functions (print_int, print_string, ...)



<u>List Operations:</u>

hd -> returns first element of list

tl -> returns everything except first one

::(cons) -> adds values onto eachother

for_all -> returns true if some condition applies to **all** the values in a list

exists -> returns true if **at least one element in a list matches a given value**

filter -> returns all the elements in a list that match a certain criteria

rev -> returns a list in **reverse**

map -> returns input list where each element has been transformed w/ given function



<u>Context Free Grammars:</u>

Grammar -> how to generate any string in a  given language

PHRASE -> N V

N -> Mary

N -> Mark

V -> eats

V -> drinks

A -> red



(*The non terminal symbol ADJECTIVE is not used on the right-hand side of any rule so it will never be used -> unreachable rule*)



### DETAILS

1. Write a funciton to determine if one list is a subset of another list

2. Are two sets equal

3. Write a function that retrusn the union of two sets

4. Write a fcuntion that returns the intersection of two lists

5. write a function that returns the difference of two sets

6. write a functino that returns the fixed point of a function (value x where f(x) = x)

7. Write a funciton that takes a grammar and returns where it removes all unreachable rules

   

<u>SUBMIT</u>:

hw1.ml - The functions that you implemented

hw1test.ml - Test cases for your functions

hw1.txt - wrtitten assessment



<u>HINTS:</u>

- READ THE TEST CASES

- Read thru documentation for Lists and Pervasives modules
- Think whether the functions that you wrote for earlier problems can be used to solve later problems
- Ocaml tutorials yay (?)