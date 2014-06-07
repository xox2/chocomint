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
  echo \'bdbsd $i #:nonono $i
  echo \"fasdfasd $i
  #:oodfipasid $i
done

echo "pipe command" | cat

str=`echo subshell zxc | cat`
str=$(echo subshell qwe | cat)
echo "str=\"$str\"" #: $str
echo "str=\'$str\'" #: $str

true \
  true

true \
#: backslash newline test
true \
  #: backslash whitespace newline test

multiple_line='a #:
sadasdasdasda\
adsa #: asdasd'     #:    status=0
echo $multiple_line #:    status=0    match='ads'

echo 'a #: sadasdasdasdsdfashfljsdlfhashasklhfljlksdhflkjahsdflkhaslkfhasolkjfaasdasdasd'
	#:    status=0    match='ads'

     echo '342 #:
1231234324
2343452345' #: status=0 match='2343'

echo "dummy" #: match='dummy'
false #: status=1






