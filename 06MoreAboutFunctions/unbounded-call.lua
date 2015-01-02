-- [[
Exercise6.3: Sometimes, a language with proper-tail calls
is called *properly tail recursive*, with the argument that
this property is revlevant only when we have recursive calls.
(Without recursive calls, the maximum call depth of a program
would be statically fixed.)

SHow that this argument does not hold in a dynamic language like
Lua: write a program that performs an unbounded call chain without
recursion.
-- ]]

-- Solution

-- [[
In Lua 5.2, `load(ld)` loads a chunk. And if ld is a function, 
load calls it repeatedly to get the chunk pieces. Each call to
ld must return a string that concatenates with previous results. 
A return of an empty string, nil, or no value signals the end of the chunk.

Since `load` will repeatedly calls a function, we can use it to build
an unbounded call chain with random numbers.
-- ]]

n = math.random(123456789)

function f ()
  n = n - 1;                                                                                                                                           
  if n < 0 then
    return nil
  else
    return 'i = 1;' 
  end
end 

load(f)()
