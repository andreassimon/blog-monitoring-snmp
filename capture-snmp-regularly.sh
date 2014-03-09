#!/bin/bash
# region all
interval=${1:-60}
host="10.0.0.3"
export MIBS=ALL
while true; do
  timestamp=$(date +%s%N | cut -b1-13)
  record_dir="$host/$timestamp"
  echo "Recording SNMP indicators to $record_dir/"
  mkdir --parents "$record_dir"
  # snmpwalk -t 1 -v2c -c public $host             > $record_dir/$host.snmpwalk
  snmpwalk -t 1 -v2c -c public $host systemStats > $record_dir/$host.systemStats.snmpwalk
  snmpwalk -t 1 -v2c -c public $host memory      > $record_dir/$host.memory.snmpwalk
  sleep $interval
done
# endregion all
