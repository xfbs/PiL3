The Operating System Library
----------------------------

- It is defined in the table `os`
- Includes functions for file manipulation, getting the current
  date and time, and other facilities related to the operating
  system
- Because Lua is written in ANSI C, it uses only the functionality
  that the ANSI standard offers
- For date and time, the `os` library offers two functions
- The `os.time()` functions returns the current date and time,
  coded as a number (usually a UNIX timestamp)
- When called with a table, it returns the number representing
  the date and time described by the table
- Such a *date table* has the following fields: `year`, `month`,
  `day`, `hour`, `min`, `sec`, `isdst` (true if daylight saving
  is on)
- Note that the result of the `os.time()` call depends on the
  system's time zone
- The `os.date()` function is a kind of a reverse of the `os.time()`
  function: it converts the number describing the date and time into
  some higher-level representation
- It's first parameter is a format string describing the representation
  we want
- To produce a table, we use the format string `*t`, like so:
  `os.date("*t", 906000490)`
- Format strings have a similar syntax to that of `string.format()`,
  however there are more possible values
- For timing, the `os` library offers `os.clock()`, which returns the
  number of seconds of CPU time have passed for the program
- Other systems calls that the library supports are leaned on
  the called available in standard C:

    `os.exit()`
    :   terminates the execution of the program, taking as parameter
        the return status of the program, and as second argument
        whether to close the Lua state (and calling finalizers) or
        not

    `os.getenv()`
    :   gets the value of an environment variable, taking as argument
        the name of the variable and returning it's value

    `os.execute()`
    :   runs a system command

    `os.setlocale()`
    :   sets the current locale used by the Lua program

- Care must be taken to set the locale of the Lua program to the
  standard `C` locale when creating pieces of code from within Lua

