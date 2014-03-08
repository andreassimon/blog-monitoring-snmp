#!/bin/bash
for recording in $( ls --directory */ ); do
  host=$( echo "$recording" | sed 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)-\([0-9]\+\)\//\1/' )
  timestamp=$( echo "$recording" | sed 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)-\([0-9]\+\)\//\2/' )
  cat $host-$timestamp/*.snmpwalk | ./cleanup-snmp-data.sh | sed "s/^/$host,$timestamp,/"
done 
