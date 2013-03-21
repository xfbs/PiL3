Chapter 19: The Bitwise Library
===============================

- It is not easy to conciliate bitwise operations with floating-
  point numbers
- Lua 5.2 offers bitwise operations through a library: the 
  `bit32` library
- The bitwise library operates on unsigned 32-bit integers
- It defines the following functions:

    `band(...)`
    :   Binary *and* of the passed numbers

    `bor(...)`
    :   Binary *or* of the passed numbers

    `bnot(n)`
    :   Binary *not* (negation) of *n*

    `btest(...)`
    :   Same as binary *and*, but returns `true` if the result
        is nonzero and `false` otherwise

    `lshift(n, a)`
    :   Shift all bits of *n* to the left by a given amount *a*, 
        filling empty spots with zero bits

    `rshift(n, a)`
    :   Shift all bits of *n* to the right by a given amount *a*, 
        filling empty spots with zero bits

    `arshift(n, a)`
    :   Shift all bits of *n* to the right by a given amount *a*
        (to the left if that amount is negative), fill vacant bits on
        the left with copies of the last bit (the *signal bit*)

    `lrotate(n, a)`
    :   Rotate the bits of *n* to the left by a given amount *a*

    `rrotate(n, a)`
    :   Rotate the bits of *n* to the right by a given amount *a*

    `extract(n, p, w)`
    :   Extract *w* bits (1 if no *w* parameter specified) of 
        *n*, starting at bit *p* (bits are counted from the
        right, starting at 0)

    `replace(n, b, p, w)`
    :   Replace *w* bits of *n* with the ones specified in *b*,
        starting at position *p*

- All functions will convert numbers to be in the range
  0 to MAX, where max is 2^32^-1
- Numbers can be manually converted with the `bor()` or the
  `band()` function (by passing them as the sole argument)
