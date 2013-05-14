#!/bin/bash
# generated the global notes.markdown as well as
# notes.pdf, for the latter to work, pandoc must
# be installed

# empty out the global notes.markdown
echo -n > notes.markdown

# add header
echo "Programming in Lua Notes
========================

Programming in Lua gives a solid base for any programmer who wants to use
Lua. It covers all aspects of Lua—from the basics to its API with C—explaining
how to make good use of its features and giving numerous code examples.
The book is targeted at people with some programming background, but it
does not assume any prior knowledge about Lua or other scripting languages.
" >> notes.markdown

# compile it
for note in ./*/notes.markdown; do
    cat $note >> notes.markdown;
    echo >> notes.markdown; # add newline to the end of it
done

# make pdf
pandoc -o notes.pdf notes.markdown
