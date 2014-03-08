#!/bin/bash
for recording in $( ls --directory */ ); do
  host=$( echo "$recording" | sed 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)-\([0-9]\+\)\//\1/' )
  timestamp=$( echo "$recording" | sed 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)-\([0-9]\+\)\//\2/' )
  echo $host
  echo $timestamp
done 
