#!/bin/bash
# vim: ft=sh

true No.1
#: status:0

. tests/dummy   #: status:0

false #: status:1

echo 1234 #: status:0 match:'1234'

false # Just a comment

for i in 1 2 3
do
  echo count $i #: match:"$i"
done

echo "pipe" | cat

str='first'
str=`echo here is subshell | cat`
echo "$str" #: $str!=3 $str!='aabbcc' status!:9 match:'here'
str=$(echo 10 | cat)
echo "str=$str"
#: $str='10' $str!=100 match:'str'

multiple_line='a
b
c' #: status:0

echo "$multiple_line" #: status:0 match:'b'

