#!/bin/bash

echo "All variables passed to the script:$@"

echo "Script name:$0"

echo "current directlry:$PWD"

echo "Who is running this:"$USER

echo "Home directory of user $HOME"

echo "PID of the script: $$"

sleep 10 &

echo "PID of the last excecuted command"$!