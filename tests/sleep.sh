line=0
left=0
i=0

func3() {
  sleep 3 #: status:0
}

func2() {
  sleep 2
  func3 #: status:0
}

func() {
  sleep 1
  func2 #: status:0
}

func #: status:0

echo $line #: stdout:'0'
echo $left #: stdout:'0'
echo $i #: stdout:'0'
