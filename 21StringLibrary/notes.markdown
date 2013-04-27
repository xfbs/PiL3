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
  them with a few features left out
- Unicode text can be represented in Lua strings, but the functions that the
  string library offers don't all work on them

