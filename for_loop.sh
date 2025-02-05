#!/bin/bash

MY_LIST=(one two three)

for item in ${MY_LIST[@]}; do echo -n $item | wc -c; done # -n is just to ignore new line charecters
