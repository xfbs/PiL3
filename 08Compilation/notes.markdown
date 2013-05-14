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
