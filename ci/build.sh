#!/bin/bash -ex

if [ "$BUILD_AUTODOC" = "No" ]; then
    ARGS=''
else
    ARGS='-t autodoc'
fi

nox -s build -- $ARGS
