#!/bin/bash
# vim: ft=sh

true No.1
#: status:0 status!:10 status:1

. tests/dummy   #: status:0

false #: status:1

echo "error out" >&2
#: match:'error' match!:'error' match:'success'

echo 1234 #: status:0 match:'1234'

sleep 2; false #: status:1

ls --nothing #: status:0

for i in 1 2 3
do
  echo "count $i" #: match:"$i"
done

echo "pipe" | cat

str='first'
str=`echo \"here\" is subshell | cat`
echo "$str" #: $str!=3 $str!='aabbcc' status!:9 match:'here'
str=$(echo 10 | cat)
echo "str=$str"
#: $str='10' $str!=100 match:'str'

multiple_line='line one: a
line two: b
line three: c' #: status:0 $multiple_line='dummytest'

echo "$multiple_line" #: status:0 match:'b'

