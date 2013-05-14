Coroutines
----------

- Coroutines in Lua are like threads: they are a line of execution with their
  own stack, local variables and instruction pointer but sharing the global
  variables
- Coroutines run *concurrently*, not *parallel*: there's always **just one** 
  coroutine currently running
- Coroutines are a means of *cooperative multitasking* (as opposed to
  *preemtptive multitasking*): their execution is only suspended if they
  explicitly ask for it
- All coroutine functions are in the `coroutine` table
- They can be created with `coroutine.create()`, which takes a function as argument
- Coroutines are of type `thread`
- Coroutines can be in one of four states:

    `normal`
    :   This is the state a coroutine gets into when it calls
        `coroutine.resume()` on some other coroutine: it is neither `running` 
        nor `suspended`, since it can't be resumed when in this state.

    `running`
    :   This is the state a coroutine is in when it's running

    `suspended`
    :   Newly created coroutines are in this state, as well as
        coroutines that have suspended themselves (with `coroutine.yield()`)

    `dead`
    :   The coroutine enters this state if the coroutine function returns,
        it is not possible to resume a dead coroutine

- Their status can be checked with `coroutine.status()`
- The real power comes from the `coroutine.yield()` function, which suspends 
  the currently running coroutine and passes control back to the coroutine that 
  caused it to run in the first place (with `coroutine.resume()`)
- `coroutine.resume()` runs in *protected mode*, so any error raised from within 
  the coroutine will be returned by it, just like with `pcall()`
- The resume and yield functions can **exchange data**: an argument to any of them 
  becomes a return value of the other
- *Symmetric coroutines* of other languages can be easily emulated in Lua
- Coroutines offer a great way to tackle the *producer-consumer problem* (the
  *who-has-the-main-loop* problem)
- They can also turn the caller/callee relationship inside out: now the callee
  can request from the caller (by resuming the caller)
- Coroutines offer a kind of *non-preemptive* (*cooperative*) multitasking, but
  since there is no parallelism involved, the code is easy to debug and there
  is no need for synchronization
- The cost of switching between coroutines is **really small** compared to
  switching between processes (as in UNIX pipes)
- They can be used to easily write iterators without having to worry about
  keeping a state
- The non-preemptive multitasking that they offer can be used to concurrently
  download files from the internet if *non-blocking sockets* are available
