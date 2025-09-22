#!/bin/bash

NUM1=$1

if [ $NUM1 -lt 10 ] ; then
    echo "Given no: is less than 10"
elif [ $NUM1 -eq 10 ]; then
    echo "Given no: is 10"
else
    echo "Given no: is greater than 10"
fi