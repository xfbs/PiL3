Exercise 1.2
============

> Run the twice example, both by loading the 
> file with the `-l` option and with `dofile()`.
> Which way do you prefer?

While both ways work, I prefer the `dofile()` approach,
because like that there is no possibility of forgetting
to set the right flag when executing the file, and
because `twice.lua` can't run without the functions
defined in `lib1.lua`, so there is no point in making
loading that file optional (via a command-line flag).
