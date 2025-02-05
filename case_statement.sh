#!/bin/bash

case ${1,,} in
    abc | administrator)
        echo "Hello, you are the boss here"
        ;;
    help)
        echo "Just enter your username!"
        ;;
    *)
        echo "wrong username"
esac