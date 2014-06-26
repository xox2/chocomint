#!/bin/bash
# vim: ft=sh

for qqq in 1 2 3
do
  echo \'first $qqq #: match:"$qqq"
  . tests/dummy
  echo \"second $qqq
  #: match:"$qqq"
done


