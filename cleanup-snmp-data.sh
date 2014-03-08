#!/bin/bash
if [ -t 0 ]; then
  # script running interactively
  in=${1:-"*.snmpwalk"}
else
  # stdin coming from a pipe or file
  in="-"
fi

cat $in | \
  sed "s/UCD-SNMP-MIB:://" | \
  sed "s/INTEGER: //" | \
  sed "s/STRING: //" | \
  sed "s/Counter32: //" | \
  sed "s/\.0//"
