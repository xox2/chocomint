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
