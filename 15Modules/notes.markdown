Chapter 15: Modules and Packages
================================

- A *module* is some code (Lua or C) that can be loaded through
  `require` and that creates and returns a table
- Everything that a module exports is defined inside this table,
  which works as a namespace
- Thus, we can manipulate modules like any other table
- Once a module is loaded, it will be reused by whatever part
  of the program requires it again
- The first step of the call `require "modname"` is to check in
  `package.loaded` whether the module is already loaded
- If not, it searches for a Lua file with the module name, which
  would be loaded with `loadfile`
- If that doesn't work either, it looks for a C library with the
  module name
- If it finds a C library, it looks for the function `luaopen_modname`
- Once it got a loader function, this is called with two arguments:
  the module name and the name of the file where it got the loader
- To find Lua files, Lua uses a couple of *templates* defined
  in `package.paths`
- The same applies the C libraries, but their paths are in
  `packages.cpaths`
- Writing a module is simple: create a table with all the functions
  that should be exported in it and return it
- We can use some `_ENV` tricks to automatically build the table
