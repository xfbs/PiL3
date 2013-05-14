Iterators and the Generic for
-----------------------------

- An iterator is any construction that allows you to *iterate* over the elements
  of a collection
- They are typically represented by functions (closures) in Lua
- A closure iterator involves two functions: the closure itself and a *factory*,
  which creates the closure and it's nonlocal variables (the *state*)
- Iterators may not be easy to write, but they are easy to use
- The generic for does all the bookkeeping for an iteration loop and it also
  keeps an *invariant state variable* (can be used to keep a state) and a 
  *control variable*
- When the first variable returned by the iterator (called the control variable)
  is `nil`, the loop ends
- With the invariant state and the control variable, we can write *stateless
  iterators* (like `ipairs()`, which is also stateless): these do not use
  nonlocal variables to keep their state
- Complex states can be stored in the invariant state variable by using a
  table
- *True iterators* are functions that do the iteration themselfes, they take an
  anonymous function as argument and call that for every element
- They aren't used very much anymore since they have some drawbacks 
  (like difficult parallel iteration)
