#!/bin/bash
systemctl stop test
rm -rf /run/test
mkdir -p /run/test
chown readsb /run/test
source /etc/default/test
cp -f readsb /tmp/test123

MEM="--track-origins=yes"
MEM="--show-leak-kinds=all --leak-check=full"
MEM=""

FIRST=""
MEM="--show-leak-kinds=all --track-origins=yes --leak-check=full"
FIRST="--error-exitcode=3 --exit-on-first-error=yes"
MEM="--show-leak-kinds=all --leak-check=full"

valgrind $MASSIF $FIRST $MEM /tmp/test123 $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS --quiet --db-file=none $@

