The I/O Library
---------------

- Lua offers two different models for file manipulation
- The *simple I/O model* does all its operations on two
  current files: the standard input (*stdin*) and the standard
  output (*stdout*)
- By default, *stdin* and *stdout* are connected to the console
  from which the program is executed
- Operations such as `io.write()` operate on the standard input
  and output files
- These current files can be changed with the `io.input()` and
  `io.output()` functions
- There are two main functions to work with the simple model:

    `io.write`
    :   gets an arbitrary number of string arguments and writes
        them to the current output file, similar to the `print`
        function, but offers more control over the output.

    `io.read`
    :   reads strings from the current input file, and takes
        arguments describing what to read:

        - `*a` to read the whole file
        - `*l` to read a single line (without newline)
        - `*L` to read a single line (with newline)
        - `*n` to read a number, skipping any spaces prior 
          to it or `nil` when it can't find one
        - *num* reads a string with up to *num* characters

- The *complete I/O model* offers more control and multiple
  open files with something called *file handles*, which are
  equivalent to `FILE*` streams in C
- Every open file has a *file handle* associated with it, which
  is an object that has methods for manipulating the file
- The `io.open()` function can be used to open a file and get
  a handle for it, it takes as arguments the name of the file
  and in which *mode* to open it: possible are `r` for reading,
  `w` for writing and `a` for appending and an optional `b` to
  open binary files
- Just like other Lua library functions, it returns `nil` plus
  an error message and an error number in case of an error
- After having opened a file `f`, there are read methods
  (`f:read()`) and write methods (`f:write()`) available with
  the same semantics as those from the simple I/O model
- There are predefined file handles: `io.stdin`, `io.stdout`
  and `io.stderr` for the three standard C streams
- The complete model and the simple model can be mixed, for
  example `io.input():write()` does the same as `io.write()`
- To read big files in Lua it is advisable to use a relatively
  large buffer size of efficiency
- On Windows systems care must be taken to open files in the
  correct mode: binary files must be opened in *binary mode*
  to avoid their contents being changed while reading
- Binary data is usually read with the `*a` flag or with
  a given size of *n* bytes
- `io.tmpfile()` returns a handle for a temporary file, open
  in read/write mode
- For a file handle `f`, `f:flush()` executes all pending
  writes to the file
- The `setvbuf` method sets the buffering mode of a stream,
  it can be set to `"no"` (no buffering), `"full"` (the file
  is only written when the buffer is full or it's flushed) or
  `"line"` (it is buffered until a newline is output).
- The `seek()` method can be set with the `set(whence, offset)`
  method, the `whence` parameter is a string that specifies
  how to interpret the offset: `"set"` interprets strings from
  the beginning of the file, `"cur"` interprets them from the
  current position, and `"end"` interprets them relative to
  the end
- Calling `seek()` on a file pointer (like `f:seek()`) returns
  the current position in the file

