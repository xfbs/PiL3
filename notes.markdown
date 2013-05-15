% Programming in Lua Notes
% Patrick M. Elsen

Programming in Lua Notes
========================

Programming in Lua gives a solid base for any programmer who wants to use
Lua. It covers all aspects of Lua—from the basics to its API with C—explaining
how to make good use of its features and giving numerous code examples.
The book is targeted at people with some programming background, but it
does not assume any prior knowledge about Lua or other scripting languages.

Getting Started
---------------

- Each piece of code that Lua executes is called a *chunk*
- Lua needs no seperator between consecutive statements (but you can use a
  semicolon if you wish)
- To exit the interpreter, use `os.exit()`
- To parse a file from Lua, use `dofile("filename.lua")`
- Identifiers can be any string of letters, digits and underscores not
  beginning with a digit
- Lua 5.2 accepts only English letters for identifiers (`a-z` and `A-Z`)
- Comments start with a double hypen (`--`) and go to the rest of the line
- Long comments start with a `--[[` and end with `]]`
- Global variables do not need declarations, they are `nil` by default
- In interactive mode, prepending an equals sign (`=`) to any expression prints
  the result of that expression
- Any arguments to a script are in the global variable `arg` by default

Types and Values
----------------

- Lua has eight basic types: `nil`, `boolean`, `number`, `string`, `userdata`,
  `function`, `thread` and `table`
- The type of a variable can be checked using the `type()` function, which
  returns a string representing the type of the given variable
- Functions are *first-class values* in Lua, they can be used like any other
  type of variables
- Lua uses `nil` as a kind of non-value, representing the absence of a useful
  value
- **All** numbers in Lua are real (double) *floating-point numbers* (there is no
  integer type)
- In the Lua number type, any integer up to 2^53^ has an exact representation
- Due to using a double type, there can be **rounding errors**: `12.7-20+7.3` is not
  exactly zero because both 12.7 and 7.3 do not have an *exact representation*
- Number literals can be written with both an optional floating-point part (eg.
  0.1212) and exponent (eg. 3.4e-4), and can be either in base ten or hexadecimal
  (with the `0x` prefix, eg. 0xFFFF)
- Strings can contain any characters (null, any UTF-8 characters, etc.)
- Strings are *immutable* in Lua (cannot be modified)
- The length of a string can be acquired with the *length operator* (`#`)
- Strings can be delimited by single and double quotation marks (`'str'` and 
  `"str"`) as well as with double square brackets (`[[str]]`)
- Strings can be concatenated with double periods (`..`)
- Strings and numbers can be converted with `tostring()` and `tonumber()`
- The only real data type in Lua are tables, which can be used to construct
  *arrays* (sequences) as well as *records*
- Tables are handled **by reference** (thus, `{} ~= {}`)
- To access the member `abc` of table `t`, both `t["abc"]` and `t.abc` can be 
  used
- Lua global variables are stored in a table
- Lua arrays are tables that use numbers from 1 to `n` as indexes, where
  `n` is the length of the array
- The length of Lua arrays without *holes* (embedded nils) can be aquired using
  the *length operator* (`#`)
- Userdata variables allow C data to be stored in Lua variables

Expressions
-----------

- Exponentiation is done in Lua with the caret (`^`)
- Modulus is obtained from a number with the percent sign (`%`)
- The fractional and integer part of a number can be obtained using the
  modulus operator (`n%1` for the former and `n-n%1` for the latter)
- The negation of the equality operator in Lua is a tilde and an equals sign
  combined (`~=`)
- Tables and userdata are compared **by reference**
- Strings are compared in **alphabetical order** (as determined by the locale)
- Logical operators (`not`, `and`, `or`) use *short-cut evaluation*, so `f() or
  error()` is only going to call `error()` if `f()` returns false
- The Lua idiom `x = x or v` sets `x` to `v` only if `x` is not `nil` or `false`
- The Lua idiom `c and t or f` returns `t` if `c` evaluates to `true`, and `f`
  otherwise (unless `t` evaluates to `false`)
- Concatenation in Lua is done with two dots (`..`). If one of the operands is a
  number, it is converted to a string automatically
- The *concatenation operator* does not modify it's operands
- The length operator (`#`) works on strings and tables, on the latter it gives
  the length of the sequence represented by it, a sequence being a table where
  numeric keys go from 1 to n without any holes (embedded nils)
- Tables can be constructed by a few different constructors:

    **List constructor**
    :   constructs the table to be a sequence, has no notion of keys and looks 
        like this: `{324, "value two", true, ...}`

    **Record constructor**
    :   constructs the table to be a record, has keys which must be valid Lua
        identifiers and looks like this: `{fieldone=10, fieldtwo="value two", 
        fieldthree=false, ...}`

    **General constructor**
    :   can construct any kind of table, it's keys do not need to be valid 
        identifiers and can in fact be of any type, it looks
        like this: `{["field one"]=324, ["field two"]="value two", ...}`

Statements
----------

- Lua allows *multiple assignment*, which assigns a list of values to a list of
  variables in one step, both lists have their elements seperated by commas
- Lua first evaluates all values and only then executes the assignments
  (allowing us to swap two variables with multiple assignment)
- When there are more variables than values, they are filled with `nil`s
- When there are more values than variables, they are silently discarded
- A frequent use of multiple assignment is to collect *multiple returns* from
  function calls
- Lua supports local variables with the keyword `local`
- In interactive mode, **local variables don't work as expected** because every
  line is executed in it's own chunk
- To make local variables work in interactive mode, they need to be put
  into a *do-end block*
- Access to local variables is faster than to global ones
- A common idiom in Lua is `local foo = foo`, which creates a local variable
  `foo` and assigns the global variable `foo` to it
- Lua supports *if-then-[[elseif-then]-else]-end*, *while-do*, *repeat-until*,
  *numeric for* and *generic for* control structures
- *Numeric for* starts at a given start value and ends at a given end value
  using the steps provided: `for <var> = <start>, <end>, [<step=1>] do...`
- The value of the control variable should not be changed (use `break` to
  prematurely exit the loop)
- The *generic for* traverses all values returned by an iterator function, like
  so: `for key, value in pairs(table) do...`
- There are several *iterators*: `pairs()` to traverse a table, `io.lines()` to
  iterate over the lines of a file, `ipairs()` to iterate over the entries of a
  sequence, `string.gmatch()` to iterate over words in a string and more
- A return statement can only appear as the last statement of a block
- Lua supports `goto` and labels, they are declared with `::labelname::` and can
  be jumped to with `goto labelname`
- You cannot jump into a block, out of a function or into the scope of a 
  local variable
- The scope of a local variable ends on the last *non-void statement* of the
  block where the variable is defined, labels are considered void statements
- Gotos can be used to emulate functionality like `continue`

Functions
---------

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

More about Functions
--------------------

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

Iterators and the Generic for
-----------------------------

- An iterator is any construction that allows you to *iterate* over the elements
  of a collection
- They are typically represented by functions (closures) in Lua
- A closure iterator involves two functions: the closure itself and a *factory*,
  which creates the closure and it's nonlocal variables (the *state*)
- Iterators may not be easy to write, but they are easy to use
- The generic for does all the bookkeeping for an iteration loop and it also
  keeps an *invariant state variable* (can be used to keep a state) and a 
  *control variable*
- When the first variable returned by the iterator (called the control variable)
  is `nil`, the loop ends
- With the invariant state and the control variable, we can write *stateless
  iterators* (like `ipairs()`, which is also stateless): these do not use
  nonlocal variables to keep their state
- Complex states can be stored in the invariant state variable by using a
  table
- *True iterators* are functions that do the iteration themselfes, they take an
  anonymous function as argument and call that for every element
- They aren't used very much anymore since they have some drawbacks 
  (like difficult parallel iteration)

Compilation, Execution and Errors
---------------------------------

- Lua always *precompiles* source code to intermediate form (bytecode) before 
  running it
- Lua is still considered an *interpreted language* since it is possible to
  execute code generated on the fly (with functions such as `load()`)
- The function `loadfile()` loads a Lua chunk from a file and returns a function
  that will call the chunk if called, or an error code
- We can use `loadfile()` to run a file several times (by executing the 
  returned function multiple times)
- The `load()` function is similar, but it reads its chunk from a string
- The `load()` function is powerful and rather expensive, so it should 
  be used **with care** and only when needed
- `load()` compiles code in the global environment, **without lexical scoping**
- You can use vararg expressions in `load()`ed strings since the code is 
  treated as an anonymous function
- The `string.rep()` function repeats a string a given number of times
- `load()` can take a reader function as argument, which returns the chunk in
  parts
- `io.lines(filename, "*L")` returns a function that iterates over the lines
  in the given file
- `io.lines(filename, 1024)` is more efficient since it uses a fixed-size
  buffer
- The `load()` and `loadfile()` functions **never** have any side effects
- External chunks should be run in a *protected environment*
- Lua allows code to be distributed in precompiled form, such code is allowed
  anywhere normal code would be allowed as well
- Code can be precompiled with the `luac` program
- `string.dump()` returns the precompiled code (as a string) of any Lua function
- **Maliciously corrupted binary code can crash the Lua interpreter or even
  execute user-provided machine code!**
- As a second parameter, `load()` can accept a name of the chunk to be loaded
  for debugging purposes
- The third parameter to `load()` controls what kind of chunks can be loaded
  ('`t`' for textual, '`b`' for binary and '`bt`' for both)
- Lua supports *dynamic linking* even though that is not standard ANSI C
- To dynamically link to a library, use `package.loadlib(libpath, funcname)`,
  which returns the requested function
- Often libraries are loaded with `require()`, which auto-imports all functions
  and puts them into a package
- Whenever an error is raised, Lua ends the current chunk and returns to the
  application
- The `assert()` functions checks if it's first argument is not false, if so it
  returns it, else it raises an error
- Functions can return false and an error code to show errors or call the
  `error()` function directly
- Most functions return `false` and an error code so the error can be handled
- Errors raised with `error()` can be caught using the `pcall()` function, which
  stands for *protected call*
- `pcall()` takes a function to be called in protected mode as well as a level
  argument to tell which of the functions in the call stack is the culprit
- If we want a traceback of the error, we can use the `xpcall()` function, which
  takes a *message handler function* (which is called before the stack unwinds)
- Two common message handlers are `debug.debug` (provides interactive console)
  and `debug.traceback` (builds an extended error message with the traceback)

Coroutines
----------

- Coroutines in Lua are like threads: they are a line of execution with their
  own stack, local variables and instruction pointer but sharing the global
  variables
- Coroutines run *concurrently*, not *parallel*: there's always **just one** 
  coroutine currently running
- Coroutines are a means of *cooperative multitasking* (as opposed to
  *preemtptive multitasking*): their execution is only suspended if they
  explicitly ask for it
- All coroutine functions are in the `coroutine` table
- They can be created with `coroutine.create()`, which takes a function as argument
- Coroutines are of type `thread`
- Coroutines can be in one of four states:

    `normal`
    :   This is the state a coroutine gets into when it calls
        `coroutine.resume()` on some other coroutine: it is neither `running` 
        nor `suspended`, since it can't be resumed when in this state.

    `running`
    :   This is the state a coroutine is in when it's running

    `suspended`
    :   Newly created coroutines are in this state, as well as
        coroutines that have suspended themselves (with `coroutine.yield()`)

    `dead`
    :   The coroutine enters this state if the coroutine function returns,
        it is not possible to resume a dead coroutine

- Their status can be checked with `coroutine.status()`
- The real power comes from the `coroutine.yield()` function, which suspends 
  the currently running coroutine and passes control back to the coroutine that 
  caused it to run in the first place (with `coroutine.resume()`)
- `coroutine.resume()` runs in *protected mode*, so any error raised from within 
  the coroutine will be returned by it, just like with `pcall()`
- The resume and yield functions can **exchange data**: an argument to any of them 
  becomes a return value of the other
- *Symmetric coroutines* of other languages can be easily emulated in Lua
- Coroutines offer a great way to tackle the *producer-consumer problem* (the
  *who-has-the-main-loop* problem)
- They can also turn the caller/callee relationship inside out: now the callee
  can request from the caller (by resuming the caller)
- Coroutines offer a kind of *non-preemptive* (*cooperative*) multitasking, but
  since there is no parallelism involved, the code is easy to debug and there
  is no need for synchronization
- The cost of switching between coroutines is **really small** compared to
  switching between processes (as in UNIX pipes)
- They can be used to easily write iterators without having to worry about
  keeping a state
- The non-preemptive multitasking that they offer can be used to concurrently
  download files from the internet if *non-blocking sockets* are available

Complete Examples
-----------------

- The *eight-queen puzzle* is solved with a configuration of eight
  queens on a chessboard in a way that no queen can attack another
  one
    - Any valid solution must have exactly one queen in each row
    - No two queens can be in the same column
    - No two queens can be directly diagonal to each other
- A *Markov-chain algorithm* can be used to generate pseudo-random
  text based on what words can follow a sequence of n previous words
  in a base text
- The resulting text is very, but not quite, random

Data Structures
---------------

- Tables in Lua are *the* data structure
- All other data structures can be implemented quite efficiently
  on top of Lua tables
- *Arrays* in Lua are implemented by simply indexing tables with
  integers
- They can grow as needed, elements that aren't used (equal to `nil`)
  don't take up space
- Indexing commonly starts at 1, but it can start at any other value
- *Matrices and multi-dimensional arrays* can be represented as
  either true *multi-dimensional arrays* or as *flat arrays*
- *Two-dimensional arrays* can be implemented with arrays by using
  a large array for the rows, containing one array per row which
  holds the actual data
- Allow for the most freedom (can represent *triangular matrices*)
- *Flat arrays* can also be used to represent matrices
- These can have an integer index that is composed of the two
  matrix indexes
- Otherwise, they can have a string index which is the concatenation
  of the two matrix indexes
- Either way, they can both easily represent matrices and are also
  efficient when working with *sparse matrices*: only matrix elements
  that are not `nil` take up memory
- Keys in tables have not intrinsic order, so iterations with 
  `pairs()` happen in no particular order
- Linked lists are particularly easy to implement in Lua: they are
  simply a list with a reference to the next list
- Linked lists aren't used very often since they are not really
  neccessary
- *Queues* and *double queues* can be implemented easily with
  tables that have a first and last index variables
- The first and last variables will continually increase when
  using the queues, but the available ~53 bits of integer
  precision (2^53^ representable integers) are unlikely to run out
- *Sets* and *bags* can be represented by storing the objects as 
  the keys of a table (fast lookup)
- Objects in *sets* can either be in the set (then `set[obj]==true`) 
  or not be in the set (then `set[name]==nil`)
- This behavior is achieved by using the object as indices of a 
  table and setting it's value to `true`
- *Bags* (also called **multisets**) are like **sets**, but there
  can be duplicates
- This is again trivial to implement with tables, where 
  `bag[obj]` is either `nil` (then `obj` isn't in `bag`)
  or a number describing how many times `obj` is in `bag`
- **String buffers** are sometimes needed in Lua since strings
  are immutable
- To read a file chunk by chunk, all the chunks can first be 
  stored in a table and then finally put together with
  `table.concat()`, which optionally takes a string to use as
  seperator
- File should, however, rather be read with `io.read("*a")`

Data Files and Persistence
--------------------------

- Writing data to file is easier than reading it
  back, since then it needs to be *parsed*
- Coding robust input routines is always difficult
- Lua started out as a data description language
- BibTeX was one of the inspirations for the constructor
  syntax in Lua
- We can use plain Lua to store data, which will look like
  this:

    ~~~~~
    Person{
        name = "John Doe",
        age = 35,
        email = "john@example.com",
    }
    ~~~~~

- `Person` both describes the data and represents a Lua
  function call, so we only have to define a
  sensible callback function and run the data file
- This is a *self-describing data format*, which means that
  it's easy to read and edit by hand
- Lua runs fast enough to store data like this, since data
  description has been one of the main applications of it
- To be able to write data which needs to be read back, it
  needs to be put in a known state, this process is called
  *serialization*
- We can do this recursively in Lua
- Floating-point numbers may loose precision when written
  and read back in decimal form, but we can use a hexadecimal
  format when writing: `string.format("%a", 0.4342)`
- Strings can also be properly escaped: `string.format("%q", str)`
- Tables can be serialized recursively **only** if they
  do not have *cycles* (where some parts of the table refer to
  other parts of the same table)
- To represent cycled tables, named tables are needed

Metatables and Metamethods
--------------------------

- *Metatables* allow us to change the behavior of a value when
  confronted with an undefined operation
- Whenever Lua tries to perform arithmetic operations on tables,
  it checks if any of them have a *metamethod* which defines this
  operation and runs it, otherwise it raises an error
- Tables and userdata have individual metatables, all other data
  types share one single metatable for all values of that type
- Lua always creates new tables without metatables
- We can use `setmetatable(t, mt)` to set or change
  the metatable of any type
- Any table can be the metatable of any value
- A group of related tables can share a metatable which
  describes their common behavior
- A table can be it's own metatable so that it describes
  it's own behavior
- Arithmetic metamethods are as follows:

    `__add`
    :   addition (`+`)

    `__mul`
    :   multiplication (`*`)

    `__sub`
    :   subtraction (`-`)

    `__div`
    :   division (`/`)

    `__unm`
    :   negation (`not`)

    `__mod`
    :   modulus (`%`)

    `__pow`
    :   exponentiation (`^`)

    `__concat`
    :   concatenation (`..`)

- When two tables are in an undefined expression, the left
  table's metamethod will be used if it exists, else the
  right table's metamethod will be used, and if that doesn't
  exist either, an error will be raised
- Metatables can also be used for *relational operators*:

    `__eq`
    :   equality (`==`)

    `__lt`
    :   less than comparison (`<`)

    `__le`
    :   less than or equal (`<=`)

- Equality comparison doesn't work if objects have different
  types (always returns `false`)
- Some library functions also use metamethods to change their
  behaviour:

    `__tostring`
    :   Used by `tostring()` to convert the table to a string

    `__metatable`
    :   Returned by `getmetatable()` if it exists, and subsequent
        to setting this, `setmetatable()` will raise an error
        (as this marks the table as protected)

    `__pairs`
    :   If defined, this is called by `pairs()` to get an 
        iterator for the table (especially useful for proxy tables,
        where the actual data is not stored in the table)

    `__ipairs`
    :   Just like `__pairs`, but for the `ipairs()` function

- The behaviour of tables can also be changed with
  metatables:

    `__index`
    :   Called when a nonexisting index of the table it accessed.
        Can be either a metamethod (function) or a table, the latter
        is useful for using this to implement inheritance. Otherwise,
        it can also be used to change the default value of an empty
        table. This metamethod can be bypassed by using the `rawget()`
        function.

    `__newindex`
    :   Called when a new table index is defined. This can be bypassed
        by using the `rawset()` function.

- The table access metamethods allow us to write a table that
  has no data of it's own but simply proxies all access to another
  table, for example to track access or to block certain kinds of
  access (eg. *read-only*)

The Environment
---------------

- Lua keeps all global variables in a regular table, called the
  *global environment*
- This table can be manipulated like any other table
- It is globally accessible by the name `_G`
- Can be used to dynamically get the contents of variables, like
  so: `_G["varname"]`
- However, something such as `_G["io.read"]` won't work, since
  `io.read` is not a variable (only `io` is, and `read` is a 
  member of it)
- Global variables do not need declarations
- We can change this behaviour if we like
- Since the global environment is a regular table, we can use
  metatables to change it's behavior
- In a metamethod, `debug.getinfo(2, "S")` returns a table whose
  field `what` tells whether the function that called it is
  a main chunk, a regular Lua function or a C function
- In Lua, global variables do not need to be truly global
  (they can be *nonlocal*)
- A *free name* is a name that is not bound to an explicit
  declaration, that is, it does not occur inside the scope of
  a local variable with that name
- The Lua compiler translates any free name `var` to `_ENV.var`
- This new `_ENV` variable is **not** a global variable
- Lua compiles any chunk in the presence of a predefined
  upvalue called `_ENV`, which is initialized by default
  with the global environment
- That is, Lua only has local variables, and any global
  variables are translated to local ones (`var` to `_ENV.var`,
  where `_ENV` is a local variable or upvalue)
- `_ENV` is, like `_G`, a plain regular (table) variable
- `_ENV` will refer to whatever `_ENV` variable is visible 
  at that point in the code
- The assignment `_ENV=nil` will invalidate any direct access
  to global variables in the rest of the chunk
- The main use of `_ENV` is to change the environment used
  by a piece of code
- Again, we can change the behavior of `_ENV` with metatables
- The `load()` function has an optional fourth parameter that
  gives the value for `_ENV`
- Using that, we can limit or change the environment for
  external code
- We can also use `debug.setupvalue()` to change the upvalue
  for a compiled function
- When the function is the result of `load()` or `loadfile()`, 
  Lua ensures that it has only one upvalue and that this
  upvalue is `_ENV`

Modules and Packages
--------------------

- A *module* is some code (Lua or C) that can be loaded through
  `require()` and that creates and returns a table
- Everything that a module exports is defined inside this table,
  which works as a *namespace*
- Thus, we can manipulate modules like any other table
- Once a module is loaded, it will be reused by whatever part
  of the program requires it again
- The first step of the call `require "modname"` is to check in
  `package.loaded` whether the module is already loaded
- If not, it searches for a Lua file with the module name, which
  would be loaded with `loadfile()`
- If that doesn't work either, it looks for a C library with the
  module name
- If it finds a C library, it looks for the function
  `luaopen_`*modname*`()`
- Once it got a loader function, this is called with two arguments:
  the module name and the name of the file where it got the loader
- To find Lua files, Lua uses a couple of *templates* defined
  in `package.paths`
- The same applies the C libraries, but their paths are in
  `packages.cpaths`
- Writing a module is simple: create a table with all the functions
  that should be exported in it and return it
- We can use some `_ENV` tricks to automatically build the table
- Lua also supports *submodules*, their names are formed with 
  dots: `module.submodule`
- To find submodules, Lua translates the name of the submodule
  into a path, like this: `/usr/local/lua/`*module*`/`*submodule*`.lua`
- For C libraries, `require()` looks for a function called
  `luaopen_`*module*`_`*submodule*`()` to load the submodule

Object-Oriented Programming
---------------------------

- A table in Lua is like an object in more than one sense
    - tables have a state
    - tables have an identity (a self) that is independent
      of their values
    - two objects (tables) with the same value are
      different objects
    - an object can have different values at different times
    - tables can, like objects, have their own operations
- To implement *methods* (functions that work on objects),
  a reference to the state of the object is needed
- Lua has special syntax for this:

    ~~~~~~
    Account = {balance=0} -- array object table
    
    function Account:withdraw(amount)
        -- 'self' is the state of the object
        self.balance = self.balance - amount
    end
    ~~~~~~

- The new syntax uses the *colon operator* (`:`), which hides
  having to pass the state to methods away
- It adds an extra hidden parameter in a method definition
  and in a method call (eg. `Account:withdraw(20)` implicitly
  passes an argument `self` to the function)
- *Classes* in Lua can be implemented with tables and some
  metatables magic
- Because of the way metatables work in Lua, a `new()`
  method can create instances of a class and provide an
  interface to make subclasses:

    ~~~~~~
    function Account:new(o)
        o = o or {}
        setmetatable(o, self)   -- setting metatable
        self.__index = self     -- allows subclassing
        return o
    end
    ~~~~~~

- With this kind of setup, any methods and default values
  will come from Account (due to the metatable), anything
  else will be stored in the table
- We can now override class methods in an object
- Also, like this any object acts as a class itself (you
  can call the `new()` method on any object of this class),
  this is how subclassing works:

    ~~~~~~
    -- standard account object
    acc = Account:new{balance = 5}

    -- subclass Account
    SpecialAccount = Account:new()

    -- special account object
    sacc = SpecialAccount:new{balance = 10}
    ~~~~~~

- Multiple inheritance needs some extra work to set up 
  the metatable correctly
- The way multiple inheritance can be implemented is by
  defining a metamethod `__index` which looks for a 
  requested method in all of the parents
- This means that multiple inheritance is slower than
  normal inheritance
- There are ways of restricting access to object data in
  Lua, but they are not used often
- One way is to use a proxy class which only allows
  access to methods but not private data

Weak Tables and Finalizers
--------------------------

### Weak Tables
- Lua does automatic memory management
- Lua automaticallz deletes objects that become garbage,
  using *garbage collection*
- Lua has no problems with cycles
- Sometimes the garbage collector needs your help
- *Weak tables* and *finalizers* are mechanisms that you
  can use in Lua to help the garbage collector
- *Weak tables* allow the collection of Lua objects
  that are still accessible to the program, while finalizers
  allow the collection of external objects that are not
  under control of the garbage collector
- A garbage collector can collect only what it can be
  sure is garbage
- Any object stored in a global variable is not garbage
  to Lua, even if it isn't used again
- Weak tables allow you to tell Lua that a reference should
  not prevent the reclamation of an object
- A *weak reference* is a reference to an object that is
  not considered by the garbage collector
- A *weak table* is a table whose entries are weak
- Tables have strong keys and values by default
- The weakness of a table is given by the field `__mode`
  of it's metatable, which can be `k` for weak keys,
  `v` for weak values or a combination of those
- Only objects can be collected from a weak table
- Like numbers and booleans, strings are not collected
  from weak tables
- Weak tables can be used to *memoize* functions
- In Lua 5.2, a table with weak keys and string values
  is an *ephemeron table*, where the accessibility of
  a key controls the accessibility of the corresponding
  value

### Finalizers
- A *finalizer* is a function associated with an object
  that is called when that object is about to be collected
- Finalizers are implemented through the metamethod `__gc`
- This metamethod needs to be present when setting the
  metatable to mark the object for finalization
- When the finalizer runs, it gets the object to be
  finalized as a parameter, this is called *transient
  resurrection*
- The finalizer could store the object in a global 
  variable, *permanently resurrecting* it
- Finalizers are run in reverse order that the objects
  were marked for finalization in
- The finalizer for each object runs exactly once
- Objects with finalizers are collected in two phases:
    1. The collector detects that they are not reachable
       and calls their finalizers
    2. Next time the collector detects that the object
       is not reachable, it deletes the object


The Mathematical Library
------------------------

- Comprises a standard set of mathematical functions
    - trigonometric functions (`sin`, `cos`, `tan`, `asin`, `acos`, ...)
    - exponentiation and logarithms (`exp`, `log`, `log10`)
    - rounding functions (`floor`, `ceil`)
    - `max` and `min`
    - pseudorandom number generation functions (`random`, `randomseed`)
- Additionally, it conatains some variables
    - `pi`, the mathematical constant pi
    - `huge`, the largest representable number
- All trigonometric functions use radians, but the functions `rad` and `deg`
  can be used to convert between them and degrees
- The `random` function returns a random real number between 0 and 1 when
  called without arguments
- When called with one argument, an integer `n`, it returns a random number
  between 1 and `n` inclusive
- The pesudorandom number generator needs to be seeded, this can be done
  with the current time with `math.randomseed(os.time())`


The Bitwise Library
-------------------

- It is not easy to conciliate bitwise operations with 
  floating-point numbers
- Lua 5.2 offers bitwise operations through a library: the 
  `bit32` library
- The bitwise library operates on unsigned 32-bit integers
- All functions will convert numbers to 32-bit integers (meaning
  that they are in the range 0 to `MAX`, where `MAX` is 2^32^-1)
- It defines the following functions:

    `band`
    :   binary *and*

    `bor`
    :   binary *or*

    `bnot`
    :   binary *not* (negation)

    `btest`
    :   same as binary *and*, but returns `true` if the result
        is nonzero and `false` otherwise

    `lshift`
    :   shift all bits of the number to the left by the specified 
        amount, filling empty spots with zero bits

    `rshift`
    :   just like `lshift` but in the opposite direction

    `arshift`
    :   just like `rshift`, but fills vacant bits on the left with
        copies of the last bit (the *signal bit*)

    `lrotate`
    :   rotate the bits to the left by a given amount

    `rrotate`
    :   Rotate the bits to the right by a given amount

    `extract`
    :   extract bits from a number

    `replace`
    :   replace bits of a number with different ones

- Numbers can be converted to 32-bit integers by passing them
  as the sole argument to the `band` or `bor` functions


The Table Library
-----------------

- Comprises auxillary functions to manipulate tables
  as arrays
- Provides functions to insert and remove elements from lists,
  to sort the elements of an array and to concatenate all
  string in an array:

    `table.insert`
    :   Inserts an element in a given position, moving up
        other elements to open space

    `table.remove`
    :   Removes (and returns) an element from a given position
        in an array, moving down other elements to close space

    `table.sort`
    :   Sorts an array, takes the array and optionally a sorting
        function, otherwise it uses the comparison operator (`<`)
        for sorting. This function can't sort tables, only
        sequences (arrays)!

    `table.concat`
    :   Takes a list of strings and returns the result of
        concatentaing all these strings. It can take an
        optional seperator string to seperate the strings
        from the array


The String Library
------------------

- All functions can be found in the `string` table as well as in the metatable
  of all strings
- The basic string functions are:

    `string.len`
    :   Returns the length of a string, equivalent to the length operator (`#`)

    `string.rep`
    :   Repeats a string a given amount of times

    `string.lower`
    :   Uses the current locale setting to turn all characters of a given string
        into lower-case characters

    `string.upper`
    :   Uses the current locale setting to turn all characters of a given string
        into upper-case characters

    `string.sub`
    :   From a given string, return a substring of that starting and ending at
        given indexes

    `string.char`
    :   Converts a number to whatever character it stands for in the current
        locale

    `string.byte`
    :   Converts a string into it's internal numeric representation

    `string.format`
    :   Format a string using a *format string* similar to the ones the
        C function `printf` accepts

- The string library offers additional functions for pattern matching, string
  searching and substitution
- Patterns in Lua are not full regular expressions but they are very similar to
  them with a few differences
- These are some of the constructs Lua supports:
    - *character classes*: `%a` (letters), `%c` (control characters), `%d` (digits),
      `%l` (lower-case letters, `%u` (upper-case letters), `%p` (punctuation letters),
      `%s` (space characters), `%w` (alpha-numeric characters) and `%x` (hexadecimal
      digits)
    - *magic characters*: pretty much just like in regular expressions, however
      `%` is used as the escape character (instead of the backslash)
    - *character groups* are done by enclosing the list of allowed characters in
      square brackets (this will match any English vovel: `[aeiou]`)
    - *groups* (called *captures* here) are enclosed in round brackets, like so: `(%u%l+)`. Pattern matching
      functions will return all captures individually, and as opposed to
      regular expressions, there can't be a variable amount of them (eg. they
      can't be followed by a star or a plus)
    - *lazy repetitions* can be denoted with a minus, like so: `%u[%a%s]-%.`, the
      minus means the shortest possible sequence will be matched
- Lua pattern matching facilities are not meant to work with UTF-8 encoded text,
  while they can be made to work some things will not work as intended, for example
  the character classes won't work for all characters
- Unicode text can be represented in Lua strings, but the functions that the
  string library offers don't all work on them: `string.reverse`, `string.byte`,
  `string.char`, `string.upper` and `string.lower` all shouldn't be used on UTF-8
  strings


The I/O Library
---------------

Lua offers two different models for file manipulation: the *simple
I/O model* and the *complete I/O model*, which are both similar
to I/O streams as used in C

### The Simple I/O Model
- The *simple I/O model* does all its operations on two
  current files: the standard input (*stdin*) and the standard
  output (*stdout*)
- By default, *stdin* and *stdout* are connected to the console
  from which the program is executed
- Operations such as `io.write()` operate on the standard input
  and output files
- These current files can be changed with the `io.input()` and
  `io.output()` functions
- There are two main functions to work with the simple model:

    `io.write`
    :   gets an arbitrary number of string arguments and writes
        them to the current output file, similar to the `print`
        function, but offers more control over the output.

    `io.read`
    :   reads strings from the current input file, and takes
        arguments describing what to read:

        - `*a` to read the whole file
        - `*l` to read a single line (without newline)
        - `*L` to read a single line (with newline)
        - `*n` to read a number, skipping any spaces prior 
          to it or `nil` when it can't find one
        - *num* reads a string with up to *num* characters

- The functions `io.input` and `io.output` can be used to change
  which files are opened for *stdin* and *stdout*

### The Complete I/O Model
- The *complete I/O model* offers more control and multiple
  open files with something called *file handles*, which are
  equivalent to `FILE*` streams in C
- Every open file has a *file handle* associated with it, which
  is an object that has methods for manipulating the file
- The `io.open()` function can be used to open a file and get
  a handle for it, it takes as arguments the name of the file
  and in which *mode* to open it: possible are `r` for reading,
  `w` for writing and `a` for appending and an optional `b` to
  open binary files
- Just like other Lua library functions, it returns `nil` plus
  an error message and an error number in case of an error
- After having opened a file `f`, there are read methods
  (`f:read()`) and write methods (`f:write()`) available with
  the same semantics as those from the simple I/O model
- There are predefined file handles: `io.stdin`, `io.stdout`
  and `io.stderr` for the three standard C streams
- The complete model and the simple model can be mixed, for
  example `io.input():write()` does the same as `io.write()`
- The functions `io.input` and `io.write` yield file handles
  to *stdin* and *stdout* when called without arguments
- To read big files in Lua it is advisable to use a relatively
  large buffer size of efficiency
- On Windows systems care must be taken to open files in the
  correct mode: binary files must be opened in *binary mode*
  to avoid their contents being changed while reading
- Binary data is usually read with the `*a` flag or with
  a given size of *n* bytes
- `io.tmpfile()` returns a handle for a temporary file, open
  in read/write mode
- For a file handle `f`, `f:flush()` executes all pending
  writes to the file
- The `setvbuf` method sets the buffering mode of a stream,
  it can be set to `"no"` (no buffering), `"full"` (the file
  is only written when the buffer is full or it's flushed) or
  `"line"` (it is buffered until a newline is output).
- The `seek()` method can be set with the `set(whence, offset)`
  method, the `whence` parameter is a string that specifies
  how to interpret the offset: `"set"` interprets strings from
  the beginning of the file, `"cur"` interprets them from the
  current position, and `"end"` interprets them relative to
  the end
- Calling `seek()` on a file pointer (like `f:seek()`) returns
  the current position in the file


The Operating System Library
----------------------------

- It is defined in the table `os`
- Includes functions for file manipulation, getting the current
  date and time, and other facilities related to the operating
  system
- Because Lua is written in ANSI C, it uses only the functionality
  that the ANSI standard offers
- For date and time, the `os` library offers two functions
- The `os.time()` functions returns the current date and time,
  coded as a number (usually a UNIX timestamp)
- When called with a table, it returns the number representing
  the date and time described by the table
- Such a *date table* has the following fields: `year`, `month`,
  `day`, `hour`, `min`, `sec`, `isdst` (true if daylight saving
  is on)
- Note that the result of the `os.time()` call depends on the
  system's time zone
- The `os.date()` function is a kind of a reverse of the `os.time()`
  function: it converts the number describing the date and time into
  some higher-level representation
- It's first parameter is a format string describing the representation
  we want
- To produce a table, we use the format string `*t`, like so:
  `os.date("*t", 906000490)`
- Format strings have a similar syntax to that of `string.format()`,
  however there are more possible values
- For timing, the `os` library offers `os.clock()`, which returns the
  number of seconds of CPU time have passed for the program
- Other systems calls that the library supports are leaned on
  the called available in standard C:

    `os.exit()`
    :   terminates the execution of the program, taking as parameter
        the return status of the program, and as second argument
        whether to close the Lua state (and calling finalizers) or
        not

    `os.getenv()`
    :   gets the value of an environment variable, taking as argument
        the name of the variable and returning it's value

    `os.execute()`
    :   runs a system command

    `os.setlocale()`
    :   sets the current locale used by the Lua program

- Care must be taken to set the locale of the Lua program to the
  standard `C` locale when creating pieces of code from within Lua


The Debug Library
-----------------

- The debug library offers all the primitives needed to build
  a debugger for Lua
- Should be used sparingly because it lacks performance and it
  breaks truths about the language
- It offers two kinds of functions:
    - *introspective functions*, which allow us to inspect
      several aspects of the running program
    - *hooks*, which allow us to trace the execution of a 
      program
- An important concept in the debug library is the *stack level*,
  which refers to a particular function in the calling hierarchy

    `debug.getinfo`
    :   main introspective function in the debug library, it
        offers insight into a given function but is quite slow

    `debug.traceback`
    :   constructs a traceback (a graph of the calling hierarchy)
        and returns it as a string

    `debug.getlocal`
    :   allows us to inspect the local variables of any active
        function as well as the parameters passed to it

    `debug.setlocal`
    :   like `getlocal`, but modifies a local variables instead
        of just returning it

    `debug.getupvalue`
    :   grants access to the nonlocal variables of a function
        and does not need the function to be active

    `debug.setupvalue`
    :   modifies a closure's upvalues (nonlocal variables)

- Introspection functions can also optionally take a coroutine
  as parameter to allow inspection of their states
- There are four kinds of hooks in the debug library:
    - *call* events when Lua calls a function
    - *return* events when a function returns
    - *line* events when Lua starts executing a new line of code
    - *count* events after a given number of instructions

- `debug.sethook` registers a hook with Lua so it will be called
  when the requested event takes place
- `debug.debug` starts an interactive debugging console
- The hook mechanism can be used to profile code


An Overview of the C API
------------------------

### About the C API

- Lua is an *embedded language*
- There are two kinds of interactions between Lua
  and C code:
    - As a **stand-alone language** that can be extended with
      native C code (the C code is the library), this
      makes Lua an *extensible language*
    - As a **library** to integrate into C projects to extend
      them (Lua is the library), this makes Lua an
      *extension language*
- The difference between the two kinds of interactions is the language
  which has the control
- The Lua interpreter uses Lua as a library
- The C API is the set of functions that allow C code to
  interact with Lua, it comprises a set of functions to:
    - read and write Lua global variables
    - call Lua functions
    - run pieces of Lua code
    - register C functions to be callable from within Lua
- The C API follows the *modus operandi* of C, which means
  that we must care about several inconveniences, including:
    - type checking
    - error recovery
    - memory-allocation errors
- Anything that can be done within Lua can also be done with
  the C API, however it may be more lengthy (common tasks may
  involve several API calls)
- The major component in the communication between Lua and C is
  an omnipresent virtual *stack*

### The Header Files

- The file `lua.h` defines the basic functions provided by Lua,
  it includes functions to do the following:
    - create a new Lua environment
    - invoke Lua functions (eg. `lua_pcall`)
    - read and write global variables in the Lua environment
- All functions in `lua.h` are prefixed with `lua_`
- The header fule `lauxlib.h` defines the functions provided by the
  auxillary library (*auxlib*)
- All functions in `lauxlib.h` are prefixed with `luaL_`
- They use the basic functions defined in `lua.h` to provide a 
  higher abstraction level
- The Lua library keeps all its state in the dynamic structure
  `lua_State`
- New states can be created by the `luaL_newstate` function
- The standard libraries are not loaded by default, this can
  be done with `luaL_openlibs`
- The function `luaL_loadstring` compiles Lua code, and pushes
  the resulting function to the stack, returning nonzero on error.


Extending Your Application
--------------------------

- An important use of Lua is as a *configuration language*
- You can use Lua programs as very flexible configuration
  files
- You must use the Lua API to parse the file and then get the
  values of the global setting variables
- Using `lua_pcall` to run the files means that errors are
  easily caught
- With `lua_getglobal`, global variables can be accessed
- Care must be taken to ensure type safety when reading
  Lua variables from C
- Such configuration scripts allow complex configurations,
  for example varying values depending on environment variables
- This results in more flexible programs
- Complex objects can also be read using `lua_gettable`
  (which takes the key to read from the table from the stack)
  or `lua_getfield` (which takes the key as parameter)
- For setting a table's fields, the functions `lua_settable`
  and `lua_setfield` are available
- New tables can be created on the stack with `lua_newtable`

### Calling a Lua function from C
- To call a Lua function from within C, the following steps
  must be done:
    1. push the function to the stack (for example with
       `lua_getglobal` if the function is globally visible)
    2. push the arguments to the call
    3. use `lua_pcall` to do the actual call

- `lua_pcall` takes four arguments: the Lua state, the number
  of arguments passed, the number of return values expected
  and optionally the stack index of an error-handling function
- `lua_pcall` leaves the requested amount of return values
  on the stack, either trimming them if the function returns
  too many or adding extra `nil`s
- When multiple results are returned, the first result is
  pushed first and the last one last, leaving it at the top
  of the stack
- If there is any error while `lua_pcall` is running, it
  returns one of these error codes to indicate so:
    `LUA_OK`
    :   no error occured

    `LUA_ERRRUN`
    :   a normal error occured

    `LUA_ERRMEM`
    :   a memory allocation error occured

    `LUA_ERRERR`
    :   an error occured while running the error message
        handler

    `LUA_ERRGCMM`
    :   an error occured while running a garbage-collector
        metamethod

- Additionally, when an error occured there will be no
  function return values on the stack, instead there
  will be an error message describing what went wrong
- If there was a message handler set when running
  `lua_pcall`, it will be run to create the error
  message, else the standard message is used


Calling C from Lua
------------------

### C Functions
- Lua can't call *any* C function
- When C calls a Lua function, it must follow a simple
  protocol to pass the arguments and get the results
- Similarly, for Lua to call a C function it must follow
  a protocol to get its arguments and return its results
- For Lua to call a C function, it must be registered,
  meaning that Lua needs to get its address
- Each function has its own private stack
- A C function gets its arguments from this stack and
  pushes the results to it
- All C function registered with Lua need to have this
  prototype, defined as `lua_CFunction` in `lua.h`:

    ~~~
    typedef int (*lua_CFunction) (lua_State *L);
    ~~~

- Each C function gets a single argument, the Lua state
- Each C function returns an `int` with the number of
  values it is returning in the stack
- Registering a C function with Lua can be done with
  `lua_pushcfunction`, which takes a pointer to a C
  function and pushes a value of type *function* to 
  the stack
- A C function behaves like any other function in Lua
- When writing C functions, the types of the arguments
  need to be checked

### Continuations
- The interlacement of Lua and C code can pose problems
  when dealing with coroutines: if there is a C function
  in the call path from a resume to its respective yield,
  Lua cannot save the state of that C function to
  restore it in the next resume
- Lua 5.2 improved this situation by introducing
  continuations
- Continuations allow a function to specify another
  function that will be called when the original
  function needs to be resumed
- This is useful for the function `lua_pcall`, since
  it's written in C and there may need to be resumes
  or yields across it

### C Modules
- Just like in Lua, C code can define modules
- All that is needed is a function `luaopen_`*libname*,
  which creates a table with the functions and returns
  it
- To help create this table, the macro `luaL_newlib`
  can take a list of type `luaL_Reg`, which stores
  the function names and their pointers


