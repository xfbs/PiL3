Chapter 25: An Overview of the C API
====================================

- Lua is an *embedded language*
- There are two kinds of interactions between Lua
  and C code:
    - As a stand-alone language that can be extended with
      native C code (the C code is the library), this
      makes Lua an *extensible language*
    - As a library to integrate into C projects to extend
      them (Lua is the library), this makes Lua an
      *extension language*
- The difference between the two kinds is which language
  has the control
- The Lua interpreter uses Lua as a library
- The C API is the set of functions that allow C code to
  interact with Lua, it comprises a set of functions to:
    - read and write Lua global variables
    - call Lua functions
    - run pieces of Lua code
    - register C functions to be callable from within Lua

