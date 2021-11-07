#! /usr/bin/bash

CC="gcc"
CFLAGS="-Wall"
MAIN="./src/main.c"
OUTPUT="./main"

$CC $CFLAGS $MAIN -o $OUTPUT