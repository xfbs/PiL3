Chapter 21: The String Library
==============================

- All functions can be found in the `string` table as well as in the metatable
  of all strings
- The basic string functions are:

    `string.len`
    :   Returns the length of a string, equivalent to the length operator (`#`)

    `string.rep`
    :   Repeats a string a given amount of times

    `string.lower`
    :   Uses the current locale setting to turn all characters of a given string
        into lower-case characters

    `string.upper`
    :   Uses the current locale setting to turn all characters of a given string
        into upper-case characters

    `string.sub`
    :   From a given string, return a substring of that starting and ending at
        given indexes

    `string.char`
    :   Converts a number to whatever character it stands for in the current
        locale

    `string.byte`
    :   Converts a string into it's internal numeric representation

    `string.format`
    :   Format a string using a *format string* similar to the ones the
        C function `printf` accepts

- The string library offers additional functions for pattern matching, string
  searching and substitution
- Patterns in Lua are not full regular expressions but they are very similar to
  them with a few differences
- These are some of the constructs Lua supports:
    - *character classes*: `%a` (letters), `%c` (control characters), `%d` (digits),
      `%l` (lower-case letters, `%u` (upper-case letters), `%p` (punctuation letters),
      `%s` (space characters), `%w` (alpha-numeric characters) and `%x` (hexadecimal
      digits)
    - *magic characters*: pretty much just like in regular expressions, however
      `%` is used as the escape character (instead of the backslash)
    - *character groups* are done by enclosing the list of allowed characters in
      square brackets (this will match any English vovel: `[aeiou]`)
    - *groups* (called *captures* here) are enclosed in round brackets, like so: `(%u%l+)`. Pattern matching
      functions will return all captures individually, and as opposed to
      regular expressions, there can't be a variable amount of them (eg. they
      can't be followed by a star or a plus)
    - *lazy repetitions* can be denoted with a minus, like so: `%u[%a%s]-%.`, the
      minus means the shortest possible sequence will be matched
- Lua pattern matching facilities are not meant to work with UTF-8 encoded text,
  while they can be made to work some things will not work as intended, for example
  the character classes won't work for all characters
- Unicode text can be represented in Lua strings, but the functions that the
  string library offers don't all work on them: `string.reverse`, `string.byte`,
  `string.char`, `string.upper` and `string.lower` all shouldn't be used on UTF-8
  strings

