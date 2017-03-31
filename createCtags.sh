#!/bin/bash

find ./ -name "*.c" -o -name "*.h" -o -name "*.py" > cscope.files
cscope -Rbq -i cscope.files
ctags -R --exclude=.svn
echo "finished"
