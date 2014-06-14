#!/usr/bin/env bashtf
# vim: ft=sh

#:: name='なんかのテスト'       

true No.1
#: status=0

. lib/cant_load   #: not_status=0
. lib/cant_load_
. tests/dummy   #: status=0
true _
false #:status=1

no_command_

echo 1234 #:status=0 match='1234'           

false #ただのcommentだよ

for i in 1 2 3
do
  echo \'bdbsd $i #: match="$i"
  echo \"fasdfasd $i
  #: match="$i"
done

echo "pipe command_" | cat

str=`echo サブシェルだよ | cat`
echo "strの値は、 $str です。" #: v[str]=3  not_v[str]=あいうえお status=9
str=$(echo 10 | cat)
echo "strの値は、 $str です。" #: v[str]=3  not_v[str]="a b c d $str" status=91
str="モヘンジョダロ"
echo "strの値は、 $str です。" #: v[str]=3  not_v[str]=i"$str" status=9

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
echo "$multiple_line" #:   status=0    match='asd'

echo 'a #: sadasdasdasdsdfashfljsdlfhashasklhfljlksdhflkjahsdflkhaslkfhasolkjfaasdasdasd'
	#:    status=0    match='flj'

     echo '342 #:
1231234324
2343452345' #: status=0 match='2343'

echo "dummy" #: match='dummy' status=1
echo "FFFFIIIIIINNNNIIIISSSSHHHHHH!!!!!!!" #: status=0
no_command #: status=127






