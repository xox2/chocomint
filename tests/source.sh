funcfunc() {
  echo func func shite
  return 10 #: status:10
}

func() {
  echo func shite
  funcfunc #: status:10
}

echo 1 #: status:0

#source <(echo "echo a #: status:1")

source tests/source-sub.sh

func #: status:10
