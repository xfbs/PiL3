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

