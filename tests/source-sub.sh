func_in_sub() {
  echo sub
  return 123 #: status:123
}

func_in_sub #: status:123
