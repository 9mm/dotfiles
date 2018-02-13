#/bin/bash

exec mvim $@ > /dev/null 2>&1

exit $?
