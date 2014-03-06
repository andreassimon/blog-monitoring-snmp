#!/bin/bash
cat *.snmpwalk | \
  sed "s/UCD-SNMP-MIB:://" | \
  sed "s/INTEGER: //" | \
  sed "s/STRING: //" | \
  sed "s/Counter32: //" | \
  sed "s/\.0//"
