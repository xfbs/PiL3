Chapter 25: An Overview of the C API
====================================

About the C API
---------------

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

The Header Files
----------------

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

