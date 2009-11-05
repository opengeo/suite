#!/bin/sh

if [ ! -e "`pwd`/start.jar" ]; then
  echo "This script must be run from the root of the OpenGeo suite distribution."
  exit
fi

_RUNJAVA=""
if [ "$JAVA_HOME" != "" ] && [ -e $JAVA_HOME/bin/java ]; then
  _RUNJAVA=$JAVA_HOME/bin/java
else
  which java
  if [ "$?" == "1" ]; then
    echo "JAVA_HOME is not defined, and java is not on the current PATH"
    exit
  fi
fi

GDD=$GEOSERVER_DATA_DIR
if [ "$GDD" == "" ]; then
  GDD=`pwd`/data_dir
fi

exec "$_RUNJAVA" -DGEOSERVER_DATA_DIR="$GDD" -Djava.awt.headless=true -DSTOP.PORT=8079 -DSTOP.KEY=opengeo -jar start.jar 

