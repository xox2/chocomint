func3() {
  sleep 1 #: status:0
}

func2() {
  sleep 1
  func3 #: status:0
}

func() {
  sleep 1
  func2 #: status:0
}

func #: status:0
