#!/bin/bash
###############################################
if [ ${1,,} = abc ]; then
    echo "hello there"
elif [ ${1,,} = help ]; then
    echo "Enter your username"
else
    echo "Wrong user"
fi
###############################################