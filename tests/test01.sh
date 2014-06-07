#!/usr/bin/env bashtf
# vim: ft=sh

#:: name='Testing FRAmework for SHell'       

true 1
#: status=0

. lib/lib   #: status!=0
. lib/lib
. tests/dummy   #: status!=0
true 2
false #:status=1

nocommand

echo 1234 #: status=0 match='1234'           

false #ただのcommentだよ

for i in 1 2 3
do
  echo \'bdbsd #:nonono
  echo \"fasdfasd
  #:oodfipasid
done

echo "pipe command" | cat

str=`echo subshell zxc | cat`
str=$(echo subshell qwe | cat)
echo $str

true \
  true

multiple_line='a #:
sadasdasdasda\
adsa #: asdasd'
echo $multi_line #:    status=0    match='ads'

echo 'a #: sadasdasdasdsdfashfljsdlfhashasklhfljlksdhflkjahsdflkhaslkfhasolkjfaasdasdasd'
#:    status=0    match='ads'

echo '342 #:
1231234324
2343452345' #: status=0 match='2343'

echo "dummy" #: match='dummy'
false #: status=1






