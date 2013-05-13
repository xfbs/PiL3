Chapter 24: The Debug Library
=============================

- The debug library offers all the primitives needed to build
  a debugger for Lua
- Should be used sparingly because it lacks performance and it
  breaks truths about the language
- It offers two kinds of functions:
    - *introspective functions*, which allow us to inspect
      several aspects of the running program
    - *hooks*, which allow us to trace the execution of a 
      program
- An important concept in the debug library is the *stack level*,
  which refers to a particular function in the calling hierarchy

    `debug.getinfo`
    :   main introspective function in the debug library, it
        offers insight into a given function but is quite slow

    `debug.traceback`
    :   constructs a traceback (a graph of the calling hierarchy)
        and returns it as a string

    `debug.getlocal`
    :   allows us to inspect the local variables of any active
        function as well as the parameters passed to it

    `debug.setlocal`
    :   like `getlocal`, but modifies a local variables instead
        of just returning it

    `debug.getupvalue`
    :   grants access to the nonlocal variables of a function
        and does not need the function to be active

    `debug.setupvalue`
    :   modifies a closure's upvalues (nonlocal variables)

- Introspection functions can also optionally take a coroutine
  as parameter to allow inspection of their states
- There are four kinds of hooks in the debug library:
    - *call* events when Lua calls a function
    - *return* events when a function returns
    - *line* events when Lua starts executing a new line of code
    - *count* events after a given number of instructions

- `debug.sethook` registers a hook with Lua so it will be called
  when the requested event takes place
- `debug.debug` starts an interactive debugging console
- The hook mechanism can be used to profile code

