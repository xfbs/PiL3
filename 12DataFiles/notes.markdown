Chapter 12: Data Files and Persistence
======================================

- Writing data to file is easier than reading it
  back, since then it needs to be *parsed*
- Coding robust input routines is always difficult
- Lua started out as a data description language
- BibTeX was one of the inspirations for the constructor
  syntax in Lua
- We can use plain Lua to store data, which will look like
  this:

    ~~~~~
    Person{
        name = "John Doe",
        age = 35,
        email = "john@example.com",
    }
    ~~~~~

- `Person` both describes the data and represents a Lua
  function call, so we only have to define a
  sensible callback function and run the data file
- This is a *self-describing data format*, which means that
  it's easy to read and edit by hand
- Lua runs fast enough to store data like this, since data
  description has been one of the main applications of it
- To be able to write data which needs to be read back, it
  needs to be put in a known state, this process is called
  *serialization*
- We can do this recursively in Lua
- Floating-point numbers may loose precision when written
  and read back in decimal form, but we can use a hexadecimal
  format when writing: `string.format("%a", 0.4342)`
- Strings can also be properly escaped: `string.format("%q", str)`
- Tables can be serialized recursively **only** if they
  do not have *cycles* (where some parts of the table refer to
  other parts of the same table)
- To represent cycled tables, named tables are needed
