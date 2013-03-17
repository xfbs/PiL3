Chapter 11: Data Structures
===========================

- Tables in Lua are *the* data structure
- All other data structures can be implemented quite efficiently
  on top of Lua tables
- *Arrays* in Lua are implemented by simply indexing tables with
  integers
- They can grow as needed, elements that aren't used (equal to `nil`)
  don't take up space
- Indexing commonly starts at 1, but it can start at any other value
- *Matrices and multi-dimensional arrays* can be represented as
  either true *multi-dimensional arrays* or as *flat arrays*
- *Two-dimensional arrays* can be implemented with arrays by using
  a large array for the rows, containing one array per row which
  holds the actual data
- Allow for the most freedom (can represent *triangular matrices*)
- *Flat arrays* can also be used to represent matrices
- These can have an integer index that is composed of the two
  matrix indexes
- Otherwise, they can have a string index which is the concatenation
  of the two matrix indexes
- Either way, they can both easily represent matrices and are also
  efficient when working with *sparse matrices*: only matrix elements
  that are not `nil` take up memory
- Keys in tables have not intrinsic order, so iterations with 
  `pairs()` happen in no particular order
- Linked lists are particularly easy to implement in Lua: they are
  simply a list with a reference to the next list
- Linked lists aren't used very often since they are not really
  neccessary
- *Queues* and *double queues* can be implemented easily with
  tables that have a first and last index variables
- The first and last variables will continually increase when
  using the queues, but the available ~53 bits of integer
  precision (2^53^ representable integers) are unlikely to run out
- *Sets* and *bags* can be represented by storing the objects as 
  the keys of a table (fast lookup)
- Objects in *sets* can either be in the set (then `set[obj]==true`) 
  or not be in the set (then `set[name]==nil`)
- This behavior is achieved by using the object as indices of a 
  table and setting it's value to `true`
- *Bags* (also called **multisets**) are like **sets**, but there
  can be duplicates
- This is again trivial to implement with tables, where 
  `bag[obj]` is either `nil` (then `obj` isn't in `bag`)
  or a number describing how many times `obj` is in `bag`
- **String buffers** are sometimes needed in Lua since strings
  are immutable
- To read a file chunk by chunk, all the chunks can first be 
  stored in a table and then finally put together with
  `table.concat()`, which optionally takes a string to use as
  seperator
- File should, however, rather be read with `io.read("*a")`
