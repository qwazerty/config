#! /bin/bash

NAME=$1
BASEDIR=$(dirname $0)/template
cp ${BASEDIR}/Makefile.am ${BASEDIR}/configure.ac ${BASEDIR}/.gitignore ./
cp ${BASEDIR}/AUTHORS ${BASEDIR}/README ${BASEDIR}/bootstrap ./
cp -r ${BASEDIR}/src/ ./
cp -r ${BASEDIR}/doc/ ./
sed -i -e "s/_PROJECT_/$NAME/" doc/Doxyfile
sed -i -e "s/_PROJECT_/$NAME/" Makefile.am
sed -i -e "s/_PROJECT_/$NAME/" .gitignore
sed -i -e "s/_PROJECT_/$NAME/" configure.ac
