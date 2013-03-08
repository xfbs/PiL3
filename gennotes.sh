#!/bin/bash
# generated the global notes.markdown as well as
# notes.pdf, for the latter to work, pandoc must
# be installed

# empty out the global notes.markdown
echo -n > notes.markdown

# compile it
for note in ./*/notes.markdown; do
    cat $note >> notes.markdown;
    echo >> notes.markdown; # add newline to the end of it
done

# make pdf
pandoc -o notes.pdf notes.markdown
