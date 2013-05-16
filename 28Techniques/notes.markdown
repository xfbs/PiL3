Techniques for Writing C Functions
----------------------------------

### Array Manipulation
- An array in Lua is just a table used in a specific way
- The same functions that can be used on tables also work
  with arrays
- The API provides special functions for array manipulation
  for speed and because arrays are so common:

    ~~~
    void lug_rawgeti(lua_State *L, int index, int key);
    void lua_ragseti(lua_State *L, int index, int key);
    ~~~

- The `index` refers to where the table is in the stack
- `key` refers to where the element is in the table
- Both functions use raw operations, these are faster
  and arrays seldom use metamethods
- The `luaL_checktype` function ensures that a given
  argument has a given type
- The primitive `lua_len` is equivalent to the `#` operator,
  it returns its result in the stack
- The `luaL_len` function does the same, but returns
  its result directly or raises an error if the length
  is not a number
- The `lua_call` function does an unprotected call,
  it is like `lua_pcall` but it propagates errors
  instead of returning an error code

### String Manipulation

- When a C function receives a string argument from
  Lua, there are only two rules that it must
  observe:
    - not to pop the string from the stack while
      accessing it
    - never to modify the string

- The standard API offers some function to help
  deal with strings in C
- To push a substring of a string `s` ranging from
  position `i` to position `j` inclusive, you can
  do this:

    ~~~
    lua_pushlstring(L, s+i, j-i+1);
    ~~~

- To concatenate strings, Lua offers the function
  `lua_concat`, which is equivalent to the `..`
  operator in Lua
- It converts numbers to strings and triggers
  metamethods when necessary
- It can concatenate more than two strings at
  once (any amount of values from the top of the
  stack)
- Another helpful function is `lua_pushfstring`

    ~~~
    const char *lua_pushfstring(lua_State *L, const char *fmt, ...);
    ~~~

- It is similar to the C function `sprintf` but
  does not need a buffer
- The resulting string is left on top of the stack

