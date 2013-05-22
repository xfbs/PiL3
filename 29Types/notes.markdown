User-Defined Types in C
-----------------------

- Lua can be extended with types written in C
- Arbitrary C data can be stored in Lua *userdata*
- When creating userdata, it's size can be specified:

    ~~~
    void *lua_newuserdata(lua_State *L, size_t size);
    ~~~

- Lua takes care of deallocating the memory when
  it is no longer needed
- No matter how you use a library, it should neither
  corrupt C data not produce a core dump from Lua
- This is why you need some way to identify your own
  userdata
- Userdata types can be identified by their metatable
- It is customary in Lua to register any new C type
  into the registry, using a type name as the index
  and the metatable as the value

    ~~~
    int luaL_newmetatable(lua_State *L, const char *name);
    void luaL_getmetatable(lua_State *L, const char *name);
    void *luaL_checkudata(lua_State *L, int index, const char *name);
    ~~~

- Using the `__index` metamethod, types created in
  C can behave as objects
- As in Lua tables, array access can be provided via the
  `__index` and `__newindex` metamethods
- There is also another kind of userdata in Lua:
  *light userdata*
- Light userdata only represents a C pointer
- It is a value, so when two light userdatas refer
  to the same pointer, they are equal (this does not
  apply to normal userdata since they are objects)
- Light userdata are not managed by the garbage
  collector
- In addition, they do not have metatables

