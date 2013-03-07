Chapter 3: Expressions
======================

- Exponentiation is done in Lua with the caret (`^`)
- Modulus is obtained from a number with the percent sign (`%`)
- The fractional and integer part of a number can be obtained using the
  modulus operator (`n%1` for the former and `n-n%1` for the latter)
- The negation of the equality operator in Lua is a tilde and an equals sign
  combined (`~=`)
- Tables and userdata are compared **by reference**
- Strings are compared in **alphabetical order** (as determined by the locale)
- Logical operators (`not`, `and`, `or`) use *short-cut evaluation*, so `f() or
  error()` is only going to call `error()` if `f()` returns false
- The Lua idiom `x = x or v` sets `x` to `v` only if `x` is not `nil` or `false`
- The Lua idiom `c and t or f` returns `t` if `c` evaluates to `true`, and `f`
  otherwise (unless `t` evaluates to `false`)
- Concatenation in Lua is done with two dots (`..`). If one of the operands is a
  number, it is converted to a string automatically
- The *concatenation operator* does not modify it's operands
- The length operator (`#`) works on strings and tables, on the latter it gives
  the length of the sequence represented by it, a sequence being a table where
  numeric keys go from 1 to n without any holes (embedded nils)
- Tables can be constructed by a few different constructors:
  1. **List constructor**, which constructs the table to be a sequence, looks like
     this: `{324, "value two", true, ...}`
  2. **Record constructor**, which constructs the table to be a record, looks like
     this: `{fieldone=10, fieldtwo="value two", fieldthree=false, ...}`
  3. **General constructor**, which can construct any kind of table, and it looks
     like this: `{["field one"]=324, ["field two"]="value two", ...}`
