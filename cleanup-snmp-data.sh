#!/bin/bash
cat - | \
  sed "s/UCD-SNMP-MIB:://" | \
  sed "s/INTEGER: //" | \
  sed "s/STRING: //" | \
  sed "s/Counter32: //" | \
  sed "s/\.0//" | \
  sed "s/ = /,/g"
