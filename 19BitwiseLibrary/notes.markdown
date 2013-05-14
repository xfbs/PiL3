The Bitwise Library
-------------------

- It is not easy to conciliate bitwise operations with floating-
  point numbers
- Lua 5.2 offers bitwise operations through a library: the 
  `bit32` library
- The bitwise library operates on unsigned 32-bit integers
- All functions will convert numbers to 32-bit integers (meaning
  that they are in the range 0 to `MAX`, where `MAX` is 2^32^-1)
- It defines the following functions:

    `band`
    :   binary *and*

    `bor`
    :   binary *or*

    `bnot`
    :   binary *not* (negation)

    `btest`
    :   same as binary *and*, but returns `true` if the result
        is nonzero and `false` otherwise

    `lshift`
    :   shift all bits of the number to the left by the specified 
        amount, filling empty spots with zero bits

    `rshift`
    :   just like `lshift` but in the opposite direction

    `arshift`
    :   just like `rshift`, but fills vacant bits on the left with
        copies of the last bit (the *signal bit*)

    `lrotate`
    :   rotate the bits to the left by a given amount

    `rrotate`
    :   Rotate the bits to the right by a given amount

    `extract`
    :   extract bits from a number

    `replace`
    :   replace bits of a number with different ones

- Numbers can be converted to 32-bit integers by passing them
  as the sole argument to the `band` or `bor` functions

