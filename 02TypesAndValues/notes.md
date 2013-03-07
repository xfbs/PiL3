Notes to Chapter 2: Types and Values
====================================

- Lua has eight basic types: `nil`, `boolean`, `number`, `string`, `userdata`,
  `function`, `thread` and `table`
- The type of a variable can be checked using the `type()` function, which
  returns a string representing the type of the given variable
- Functions are first-class values in Lua, they can be used like any other
  type of variables
- Lua uses `nil` as a kind of non-value, representing the absence of a useful
  value
- All numbers in Lua are real (double) floating-point numbers (there is no int
  type)
- In the Lua number type, any integer up to 2^53 has an exact representation
- Due to using a double type, there can be rounding errors: `12.7-20+7.3` is not
  exactly zero because both 12.7 and 7.3 do not have an exact representation
- Number literals can be written with both an optional floating-point part and
  exponent, and can be either in base ten or hexadecimal (with the 0x prefix)
- Strings can contain any characters (null, any UTF-8 characters, etc.)
- Strings are immutable in Lua (characters cannot be modified)
- The length of a string can be acquired with the length operator (`#`)
- Strings can be delimited by single and double quotation marks (`'str'` and 
  `"str"`) as well as with double square brackets (`[[str]]`)
- Strings can be concatenated with double periods (`..`)
- Strings and numbers can be converted with `tostring()` and `tonumber()`
- The only real data type in Lua are tables, which can be used to construct
  arrays as well as records
- Tables are handled by reference
- To access the member `abc` of table `t`, both `t["abc"]` and `t.abc` can be 
  used
- Lua global variables are stored in a table
- Lua arrays are tables that use numbers from 1 to n as indexes
- The length of Lua arrays without holes (embedded nils) can be aquired using
  the length operator (`#`)
- Userdata variables allow C data to be stored in Lua variables
