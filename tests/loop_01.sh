
#@ title: ループのなかで変数を参照する

for i in a b c
do
  echo $i
  #: stdout:$i stderr::None
done
