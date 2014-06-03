#!/usr/bin/env bashtf
# vim: ft=sh

#: name='Testing FRAmework for SHell'       

. lib/lib
true
false
#:status=1

echo 1234
#: status=0 match='1234'           

#ただのcommentだよ
false

declare -p \
  BASH_SOURCE

for i in 1 2 3
do
  echo \'bdbsd #:nonono
  echo \"fasdfasd #:oodfipasid
done

echo 'a #:
sadasdasdasda\
adsasdasdasd' #:    status=0    match='ads'
echo '342 #:
1231234324
2343452345' #: status=0 match='2343'

echo "dummy"
false
  #: status=1
