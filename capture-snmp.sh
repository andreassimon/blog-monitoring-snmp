#!/bin/bash
# region all
export MIBS=ALL
snmpwalk -v2c -c public 10.0.0.3             > 10.0.0.3.snmpwalk
snmpwalk -v2c -c public 10.0.0.3 systemStats > 10.0.0.3.systemStats.snmpwalk
snmpwalk -v2c -c public 10.0.0.3 memory      > 10.0.0.3.memory.snmpwalk
# endregion all
