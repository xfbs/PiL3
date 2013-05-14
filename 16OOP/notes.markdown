Chapter 16: Object-Oriented Programming
---------------------------------------

- A table in Lua is like an object in more than one sense
    - tables have a state
    - tables have an identity (a self) that is independent
      of their values
    - two objects (tables) with the same value are
      different objects
    - an object can have different values at different times
    - tables can, like objects, have their own operations
- To implement *methods* (functions that work on objects),
  a reference to the state of the object is needed
- Lua has special syntax for this:

    ~~~~~~
    Account = {balance=0} -- array object table
    
    function Account:withdraw(amount)
        -- 'self' is the state of the object
        self.balance = self.balance - amount
    end
    ~~~~~~

- The new syntax uses the *colon operator* (`:`), which hides
  having to pass the state to methods away
- It adds an extra hidden parameter in a method definition
  and in a method call (eg. `Account:withdraw(20)` implicitly
  passes an argument `self` to the function)
- *Classes* in Lua can be implemented with tables and some
  metatables magic
- Because of the way metatables work in Lua, a `new()`
  method can create instances of a class and provide an
  interface to make subclasses:

    ~~~~~~
    function Account:new(o)
        o = o or {}
        setmetatable(o, self)   -- setting metatable
        self.__index = self     -- allows subclassing
        return o
    end
    ~~~~~~

- With this kind of setup, any methods and default values
  will come from Account (due to the metatable), anything
  else will be stored in the table
- We can now override class methods in an object
- Also, like this any object acts as a class itself (you
  can call the `new()` method on any object of this class),
  this is how subclassing works:

    ~~~~~~
    -- standard account object
    acc = Account:new{balance = 5}

    -- subclass Account
    SpecialAccount = Account:new()

    -- special account object
    sacc = SpecialAccount:new{balance = 10}
    ~~~~~~

- Multiple inheritance needs some extra work to set up 
  the metatable correctly
- The way multiple inheritance can be implemented is by
  defining a metamethod `__index` which looks for a 
  requested method in all of the parents
- This means that multiple inheritance is slower than
  normal inheritance
- There are ways of restricting access to object data in
  Lua, but they are not used often
- One way is to use a proxy class which only allows
  access to methods but not private data
