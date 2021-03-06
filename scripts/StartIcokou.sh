#!/bin/bash

# Replace these three settings.
PROJDIR="/home/alan/icokou.com/icokou"
DJANDIR="$PROJDIR/icokou"
PIDFILE="$PROJDIR/icokou.pid"
SOCKET="$PROJDIR/icokou.sock"

# remove pidfile
cd $PROJDIR
if [ -f $PIDFILE ]; then
    rm -f -- $PIDFILE
fi

# start program
cd $DJANDIR
python manage.py runfcgi method=threaded socket=$SOCKET pidfile=$PIDFILE --settings=icokou.settingsBeta
chmod 777 $SOCKET
