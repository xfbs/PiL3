Memory Management
-----------------

Lua allocates all its data structures dynamically. As
such, it needs to make sure it does not use more memory
than it really needs. It keeps a tight control over its
memory use; when we close a Lua state, Lua explicitly
frees all its memory. Additionally, it has a *garbage
collector* running, which frees unused memory. This
is convenient for most applications, some special
applications, however, may require adaptations.

### Memory Allocation
- The Lua code does not assume anything about how to
  allocate memory: it does all its memory allocation
  and deallocation through one single *allocation
  function*, which the user must provide when she
  creates a new Lua state
- This function by default uses the standard
  `malloc`-`realloc`-`free` functions
- It is easy to override this allocation function
- Using `lua_getallocf`, you can get a pointer to
  the allocation function in use by a state

### The Garbage Collector
- With version 5.1 Lua got an *incremental collector*,
  which does not need to stop execution to perform
  a garbage collection cycle
- It works in three steps: *mark*, *clean* and *sweep*.
- It has a C and a Lua interface with these two functions:

    ~~~
    int lua_gc(lua_State *L, int what, int data)
    collectgarbage(what [, data])
    ~~~

- This API allows some aspects of the garbage collector
  to be controlled

    `LUA_GCSTOP`
    :   stops the collector

    `LUA_GCRESTART`
    :   restarts the collector

    `LUA_GCCOLLECT`
    :   performs a complete garbage-collection cycle

    `LUA_GCSTEP`
    :   performs some garbage-collection work

    `LUA_GCCOUNT`
    :   returns the number of kilobytesof memory in use by Lua

    `LUA_GCCOUNTB`
    :   returns the fraction of the number of kilobytes memory in use

    `LUA_GCSETPAUSE`
    :   sets the collector's `pause` parameter in percentage points

    `LUA_GCSTEPMUL`
    :   sets the collector's step multiplier in percentage points

- Any garbage collector trades memory for CPU time
- The parameters `pause` and `stepmul` allow some control
  over the collector's character
- This allows customizing the garbage collector for the requirements

