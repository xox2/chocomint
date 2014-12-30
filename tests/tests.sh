#!/usr/bin/env chocomint
# test.sh

#@ name: THIS TEST TITLE IS HERE

true #: status:0 output::None

echo "Hello"
#: stdout:'hello' status!:1

source tests/tests2.sh

func #: stderr:'error' stdout:~'.*std.*'
     #: status:3
     #: output::None

sleep 2 #: status:0

for i in 1 2 3
do
  echo $i
  #: stdout:"$i"
  #: stdout:"1"
  #: status!:1
done
