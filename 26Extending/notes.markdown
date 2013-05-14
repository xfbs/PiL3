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

