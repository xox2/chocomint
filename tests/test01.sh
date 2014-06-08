#!/usr/bin/env bashtf
# vim: ft=sh

#:: name='Testing FRAmework for SHell'       

true No.1
#: status=0

. lib/cant_load   #: status!=0
. lib/cant_load
. tests/dummy   #: status=0
true
false #:status=1

no_command

echo 1234 #:status=0 match='1234'           

false #ただのcommentだよ

for i in 1 2 3
do
  echo \'bdbsd $i #: match="$i"
  echo \"fasdfasd $i
  #: match="$i"
done

echo "pipe command" | cat

str=`echo subshell zxc | cat`
str=$(echo subshell qwe | cat)
echo "str=\"$str\"" #: match="$str $str" status=0
echo "str=\'$str\'" #: match="$str $str" status=0

true \
  true

ls --version
ls --s

true \
#: status=0
true \
  #: status=0

multiple_line='a #:
sadasdasdasda\
adsa #: asdasd'     #:    status=0
echo "$multiple_line" #:    status=0    match='asd'

echo 'a #: sadasdasdasdsdfashfljsdlfhashasklhfljlksdhflkjahsdflkhaslkfhasolkjfaasdasdasd'
	#:    status=0    match='flj'

     echo '342 #:
1231234324
2343452345' #: status=0 match='2343'

echo "dummy" #: match='dummy'
echo "FFFFIIIIIINNNNIIIISSSSHHHHHH!!!!!!!" #: status=0
no_command #: status=127






