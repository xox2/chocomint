# test2.sh
#@ name: second test

function func2() {
  echo 'out error 2' 1>&2
  echo 'out stdout 2'
  return 5
}

function func() {
  echo 'out error' 1>&2
  echo 'out stdout'
  func2 #: status:5
              #: output::None
  return 3
  #: status:3
  #: output::None
}
