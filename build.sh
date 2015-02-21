#!/bin/bash

# usage:
# 	build.sh xxx/main.xml
BASEDIR=$(cd $(dirname $0) && pwd)

baseName=`basename $1`
docDir=$(cd $(dirname $1) && pwd)
docMain=$docDir"/"$baseName
echo $docDir
echo $docMain
cd $BASEDIR
ant build -Ddoc.dir=docDir -Ddoc.main=$docMain