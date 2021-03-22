#!/bin/bash
# run and display coverage report properly filtered in terminal, xml or html
# usage: ./coverage.sh [ xml | html ]
usage()
{
    echo "usage: ./coverage.sh [ xml | html | badge ]"
}

#### Main
coverage run --source=. -m unittest
if [ -z "$1" ]; then
    coverage report -m --fail-under=80 --omit='darts/tests*,*__init__.py'
else
    case $1 in
        xml )  coverage xml --fail-under=80 --omit='darts/tests*,*__init__.py' ;;
        html ) coverage html --fail-under=80 --omit='darts/tests*,*__init__.py' ;;
        badge ) coverage report -m --omit='darts/tests*,*__init__.py' | grep TOTAL | grep -Eo '[0-9]+%' ;;
        * )    usage; exit 1;;
    esac
fi
