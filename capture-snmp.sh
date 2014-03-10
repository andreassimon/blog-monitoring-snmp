#!/bin/bash
# region all
# region mibs
export MIBS=ALL
# endregion mibs
snmpwalk -v2c -c public 10.0.0.3             > 10.0.0.3.snmpwalk
# region category-walks
snmpwalk -v2c -c public 10.0.0.3 systemStats > 10.0.0.3.systemStats.snmpwalk
snmpwalk -v2c -c public 10.0.0.3 memory      > 10.0.0.3.memory.snmpwalk
# endregion category-walks
# endregion all
