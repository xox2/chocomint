#!/bin/bash
# vim: ft=sh

true No.1
#: status:0

. lib/cant_load   #: status!:0
. lib/cant_load_
. tests/dummy   #: status:0
true _
false #:status:1

no_command_

echo 1234 #:status:0 match:'1234'           

false #ただのcommentだよ

for i in 1 2 3
do
  echo \'bdbsd $i #: match:"sd $i"
  echo \"fasdfasd $i
  #: match:"$i"
done

echo "pipe command_" | cat

str=`echo サブシェルだよ | cat`
echo "strの値は、 $str です。" #: $str=3  $str!=あいうえお status:9 match:'dakdjhflash'
str=$(echo 10 | cat)
echo "strの値は、 $str です。"
#: $str=3  $str!="a b c d e f g h i $str" match:"\""'$''P''W''D'" ""$PWD"'"' status:9999999999999999999999999999
str="モヘンジョダロ"
echo "strの値は、 $str です。" #: $str=3  $str!="$str" status:9

true \
  true

ls --version
ls --s

true \
#: status:0 match:'popo'
true \
  #: status:0

multiple_line='a #:
sadasdasdasda\
adsa #: asdasd'     #:    status:0
echo "$multiple_line" #:   status:0    match:'asd'

echo 'a #: sadasdasdasdsdfashfljsdlfhashasklhfljlksdhflkjahsdflkhaslkfhasolkjfaasdasdasd'
	#:    status:0    match:'flj'

     echo '342 #:
1231234324
2343452345' #: status:0 match:'2343'

echo "dummy" #: match:'dummy' status:1
echo "FFFFIIIIIINNNNIIIISSSSHHHHHH!!!!!!!" #: status:0
no_command #: status:127






