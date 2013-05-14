The Mathematical Library
------------------------

- Comprises a standard set of mathematical functions
    - trigonometric functions (`sin`, `cos`, `tan`, `asin`, `acos`, ...)
    - exponentiation and logarithms (`exp`, `log`, `log10`)
    - rounding functions (`floor`, `ceil`)
    - `max` and `min`
    - pseudorandom number generation functions (`random`, `randomseed`)
- Additionally, it conatains some variables
    - `pi`, the mathematical constant pi
    - `huge`, the largest representable number
- All trigonometric functions use radians, but the functions `rad` and `deg`
  can be used to convert between them and degrees
- The `random` function returns a random real number between 0 and 1 when
  called without arguments
- When called with one argument, an integer `n`, it returns a random number
  between 1 and `n` inclusive
- The pesudorandom number generator needs to be seeded, this can be done
  with the current time with `math.randomseed(os.time())`

