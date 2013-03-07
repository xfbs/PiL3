Chapter 1: Getting Started
==========================

- Each piece of code that Lua executes is called a *chunk*
- Lua needs no seperator between consecutive statements (but you can use a
  semicolon if you wish)
- To exit the interpreter, use `os.exit()`
- To parse a file from Lua, use `dofile("filename.lua")`
- Identifiers can be any string of letters, digits and underscores not
  beginning with a digit
- Lua 5.2 accepts only English letters for identifiers (`a-z` and `A-Z`)
- Comments start with a double hypen (`--`) and go to the rest of the line
- Long comments start with a `--[[` and end with `]]`
- Global variables do not need declarations, they are `nil` by default
- In interactive mode, prepending and equals sign (`=`) to any expression prints
  the result of that expression
- Any arguments to a script are in the global variable `arg` by default
