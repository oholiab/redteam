#!/bin/bash
target="$1"
DIFF_DIR=/opt/nmap_diff
mkdir -p $DIFF_DIR
today=$(date +%Y-%m-%d)
yesterday=$(date -d yesterday +%Y-%m-%d)
today_scan=$DIFF_DIR/scan_${target}_${today}.xml
yesterday_scan=$DIFF_DIR/scan_${target}_${yesterday}.xml
diff=$DIFF_DIR/diff_${target}_${today}.txt
nmap -T4 -oX $today_scan $target > /dev/null 2>&1
if [ -e $yesterday_scan ]; then
  ndiff $yesterday_scan $today_scan > $diff
fi
