Weak Tables and Finalizers
--------------------------

### Weak Tables
- Lua does automatic memory management
- Lua automaticallz deletes objects that become garbage,
  using *garbage collection*
- Lua has no problems with cycles
- Sometimes the garbage collector needs your help
- *Weak tables* and *finalizers* are mechanisms that you
  can use in Lua to help the garbage collector
- *Weak tables* allow the collection of Lua objects
  that are still accessible to the program, while finalizers
  allow the collection of external objects that are not
  under control of the garbage collector
- A garbage collector can collect only what it can be
  sure is garbage
- Any object stored in a global variable is not garbage
  to Lua, even if it isn't used again
- Weak tables allow you to tell Lua that a reference should
  not prevent the reclamation of an object
- A *weak reference* is a reference to an object that is
  not considered by the garbage collector
- A *weak table* is a table whose entries are weak
- Tables have strong keys and values by default
- The weakness of a table is given by the field `__mode`
  of it's metatable, which can be `k` for weak keys,
  `v` for weak values or a combination of those
- Only objects can be collected from a weak table
- Like numbers and booleans, strings are not collected
  from weak tables
- Weak tables can be used to *memoize* functions
- In Lua 5.2, a table with weak keys and string values
  is an *ephemeron table*, where the accessibility of
  a key controls the accessibility of the corresponding
  value

### Finalizers
- A *finalizer* is a function associated with an object
  that is called when that object is about to be collected
- Finalizers are implemented through the metamethod `__gc`
- This metamethod needs to be present when setting the
  metatable to mark the object for finalization
- When the finalizer runs, it gets the object to be
  finalized as a parameter, this is called *transient
  resurrection*
- The finalizer could store the object in a global 
  variable, *permanently resurrecting* it
- Finalizers are run in reverse order that the objects
  were marked for finalization in
- The finalizer for each object runs exactly once
- Objects with finalizers are collected in two phases:
    1. The collector detects that they are not reachable
       and calls their finalizers
    2. Next time the collector detects that the object
       is not reachable, it deletes the object

