Chapter 20: The Table Library
=============================

- Comprises auxillary functions to manipulate tables
  as arrays
- Provides functions to insert and remove elements from lists,
  to sort the elements of an array and to concatenate all
  string in an array:

    `table.insert`
    :   Inserts an element in a given position, moving up
        other elements to open space

    `table.remove`
    :   Removes (and returns) an element from a given position
        in an array, moving down other elements to close space

    `table.sort`
    :   Sorts an array, takes the array and optionally a sorting
        function, otherwise it uses the comparison operator (`<`)
        for sorting. This function can't sort tables, only
        sequences (arrays)!

    `table.concat`
    :   Takes a list of strings and returns the result of
        concatentaing all these strings. It can take an
        optional seperator string to seperate the strings
        from the array

