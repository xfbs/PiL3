Chapter 5: Functions
--------------------

- If a function has one single argument and that argument is either a string
  literal or a table constructor, the parentheses (in a function call) are
  optional
- The colon operator in Lua offers special syntax for *object oriented
  programming*: `o:method(a,b)` translates to `o.method(o,a,b)`
- You can call a function with a number of arguments different from it's
  number of parameters: extra arguments are thrown away, missing ones filled
  with `nil`
- Functions in Lua can return multiple results
- In some cases, like when the function is placed in parentheses (like so:
  `(f())`) or when it's used as an expression, only the first result is used
- The Lua function `table.unpack()` takes an array as input and returns the
  contents (using multiple return values)
- The opposite can be done with the function `table.pack()`, which turns all
  of it's parameter into an array and additionally stores the size of that 
  array in the field `n`
- Lua functions can take a variable amount of inputs with the *vararg
  expression* (`...`), which is used in place of the parameter list and expands
  to the given arguments in the function body
- *Named parameters* can be simulated in Lua by passing a table as the first and
  only argument, which allows us to have on key/value pair per argument, where
  the key is the name of that argument
- Can look like this: `copy{src="file1", dest="file2"}`
