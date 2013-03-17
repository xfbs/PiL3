Exercise 15.4
=============

> What happens if you set a metatable for table 
> `package.preload` with an `__index` metamethod?
> Can this behavior be useful?

Let's assume we are trying to load the package 
`socket`, which can be done like so:

    local socket = require "socket"

We use to `require()` function to do all the heavy
lifting for us. Since it wants to avoid doing extra
work, before actually loading anything, the
`require()` function first checks if it has loaded
the library before.

Whenever `require()` is asked to load a package,
it uses a couple of searchers to help it find the
package. One of these is the *preload* searcher.

The *preload* searcher looks in the table
`package.preload` if there is a loader function,
and if so, calls that. This allows us to override
the loading mechanism for some of the libraries.

However, since this is a regular Lua table, we can
change it's behaviour, for example by setting 
it's metamethod `__index` to some function. This
allows us to override the loading mechanism
programmatically for as many packages as we like.

I suppose that this behavior can be useful, but
more often than not there is no real need for
this.
