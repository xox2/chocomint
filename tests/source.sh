func() {
  echo func shite # status:3
}

echo 1 #: status:0

#source <(echo "echo a #: status:1")

#source tests/source-sub.sh

func

