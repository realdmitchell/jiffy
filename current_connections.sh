#!/bin/bash

lsof -i  -P  > /tmp/whoisnowconnected
grep -v COMMAND /tmp/whoisnowconnected> /tmp/whoisnowconnected1
awk '{print $1,$2,$3}' /tmp/whoisnowconnected1 > /tmp/left
awk -F">" '{print $2}' /tmp/whoisnowconnected1 > /tmp/host_right
awk '{print $1}' /tmp/host_right > /tmp/right
paste /tmp/left /tmp/right > /tmp/left_right
uniq  /tmp/left_right