Chapter 13: Metatables and Metamethods
======================================

- *Metatables* allow us to change the behavior of a value when
  confronted with an undefined operation
- Whenever Lua tried to perform arithmetic operations on tables,
  it checks if any of them have a *metamethod* which defines this
  operation and runs it, else it raises an error
- Tables and userdata have individual metatables, all other data
  types share one single metatable for all values of that type
- Lua always creates new tables without metatables
- We can use `setmetatable(tab, metatab)` to set or change
  the metatable of any type
- Any table can be the metatable of any value
- A group of related tables can share a common metatable which
  describes their common behavior
- A table can be it's own metatable so that it describes
  it's own behavior
- Arithmetic metamethods are as follows:

`__add`
:   addition (`+`)

`__mul`
:   multiplication (`*`)

`__sub`
:   subtraction (`-`)

`__div`
:   division (`/`)

`__unm`
:   negation (`not`)

`__mod`
:   modulus (`%`)

`__pow`
:   exponentiation (`^`)

`__concat`
:   concatenation (`..`)

- When two tables are in an undefined expression, the left
  table's metamethod will be used if it exists, else the
  right table's metamethod will be used, and if that doesn't
  exist either, an error will be raised
- Metatables can also be used for *relational operators*:

`__eq`
:   equality (`==`)

`__lt`
:   less than comparison (`<`)

`__le`
:   less than or equal (`<=`)

- Equality comparison doesn't work if objects have different
  types (always returns `false`)
- Some library functions also use metamethods to change their
  behaviour:

`__tostring`
:   Used by `tostring()` to convert the table to a string

`__metatable`
:   Returned by `getmetatable()` if it exists, and subsequent
    to setting this, `setmetatable()` will raise an error
    (as this marks the table as protected)

- The behaviour of tables can also be changed with
  metatables:

`__index`
:   Called when a nonexisting index of the table it accessed.
    Can be either a metamethod (function) or a table, the latter
    is useful for using this to implement inheritance. Otherwise,
    it can also be used to change the default value of an empty
    table. This metamethod can be bypassed by using the `rawget()`
    function.

`__newindex`
:   Called when a new table index is defined. This can be bypassed
    by using the `rawset()` function.

- The table access metamethods allow us to write a table that
  has no data of it's own but simply proxies all access to another
  table, for example to track access or to block certain kinds of
  access (eg. *read-only*)
