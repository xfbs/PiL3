Exercise 15.2
=============

> What happens in the search for a library if the path
> has a fixed component (that is, a component without
> a question mark)? Can this behavior be useful?

To solve this question, I decided to leave all the logic
behind and take the awkward but interesting approach of
looking to see that Lua actually does.

To accomplish this, I installed the program `strace` on
my machine (a netbook running a Debian derivate), which
lets me see what system calls Lua is performing. Quite
a fun little tool to play around with.

So, here's the first thing that I tried: setting the 
search path to my current working directory and trying
to load the module "fun". I was anticipating that Lua
would look for the file `fun.lua`, however this is not
what it did.

This is the command I used for this:

    strace lua -e "package.path='`pwd`'; require 'fun'" 2> tmp

After which the file `tmp` contains all the relevant
bits and pieces that strace is revealing about what
Lua is trying to do. This is the relevant part that
I found on my machine:

    open("/home/xfbs/Dropbox/Code/Lua/PiL/15Modules", O_RDONLY) = 3
    close(3)                                = 0
    open("/home/xfbs/Dropbox/Code/Lua/PiL/15Modules", O_RDONLY) = 3
    fstat64(3, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
    mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7780000
    read(3, 0xb7780000, 4096)               = -1 EISDIR (Is a directory)
    read(3, 0xbfa2067c, 8192)               = -1 EISDIR (Is a directory)
    close(3)                                = 0

What you can easily see is that Lua is trying to open
my current working directory and reading from it like
a file, which doesn't really seem to work out for it,
as zou can see `read()` is returning `EISADIR`. 

Alright, second try. Why don't I try setting the path
to an actual Lua file? If I'm not mistaken, Lua should
load this file, regardless of which module it's trying
to load. 

This time, I used a similar command as before, but a
little changed to have the path point to an actual Lua
file:

    strace lua -e "package.path='`pwd`/examples/module.lua'; require 'fun'" 2> tmp

This time, the strace output looks a little different.
As I thought, Lua loads the file that I put into the
path, and since it's not a directory this time, reading
from it actually works.

    open("/home/xfbs/Dropbox/Code/Lua/PiL/15Modules/examples/module.lua", O_RDONLY) = 3
    close(3)                                = 0
    open("/home/xfbs/Dropbox/Code/Lua/PiL/15Modules/examples/module.lua", O_RDONLY) = 3
    fstat64(3, {st_mode=S_IFREG|0644, st_size=1604, ...}) = 0
    mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7740000
    read(3, "-- file: module.lua\n-- an exampl"..., 4096) = 1604
    read(3, "", 4096)                       = 0
    close(3)                                = 0
    munmap(0xb7740000, 4096)                = 0

So, first Lua opens the file (line 1), then closes it
(line 2). Then it opens it again (line 3), reads from 
it (line 6-7) and then it finally closes it again (line
8).

So, if the path has some fixed component, Lua will try
to load that as a file and execute it. I guess this
has some applications, for example can one put a file
into the last slot of the path, so that if a library
isn't found, it is installed.
