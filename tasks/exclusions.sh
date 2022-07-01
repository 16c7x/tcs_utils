#!/bin/bash
while read p; do
  echo "$p"
  sed -i "/$p/d" /tmp/run_data.txt
done </tmp/exclusions.txt

while read p; do
  echo "$p"
  sed -i "/$p/d" /tmp/role_base_linux.txt
done </tmp/exclusions.txt
