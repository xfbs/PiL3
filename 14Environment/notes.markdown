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
- In Lua, global variables do not need to be truly global (eg.
  the could be *nonlocal*)
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
