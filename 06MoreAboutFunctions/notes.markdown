Chapter 6: More about Functions
===============================

- Functions in Lua are *first-class values* with *proper lexical scoping*, meaning
  that they can access variables of their enclosing functions
- Functions can be stored in tables, and passed to and returned from other
  functions
- Functions are *anonymous* (not bound to any name)
- A Function definition is actually an assignment
- Functions as first-class values can be used to write *callback functions* or
  provide a sorting strategy to `table.sort()`
- Functions that get other functions as an argument are called *higher-order
  functions*
- The variables of the parent function that a function defined inside it
  can access are neither local nor global variables, these are called
  *nonlocal variables* or *upvalues* (they *escape* their original scope)
- *Closures* make use of proper lexical scoping: they are functions with access
  to nonlocal variables
- *Nonlocal variables* persist between function calls, similar to `static`
  function variables in C
- Closures can be used to create *sandboxes* by redefining functions in a more
  limited manner and hiding the original functions
- Functions can also be stored in local variables, and Lua has syntactic sugar
  to do this (by prepending `local` before a function declaration)
- When using indirect local recursive functions, they need a kind of *forward
  declaration* to indicate that they will be local (with `local name`) and
  they then need to be defined without the local function syntactic sugar
- Lua does proper *tail-call elimination* (tail calls do not cost stack space)
- Tail calls need to be in the form `return func(args)`
