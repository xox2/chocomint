# chocomint.sh

Minimal, simple, easy, __comment-based Testing Framework__ for your command-line tools or shell scripts on Bash 4.x

## Description

You can create a test by simply appending test comments on Bash script.
chocomint.sh is a test tool that is written in Bash.
Hence if you have even Bash, other language environments such as Perl or
Ruby or Python is not required. In addition, since it is possible to use shell
variables in the test comments, you can create a test to powerful and flexible.

## Table of contents

- [Usage](#usage)
  - [Write tests](#write-tests)
  - [Run](#run)
- [Installation](#installation)
- [Reference](#reference)
  - [Test comment marker](#test-comment-marker-)
  - [Meta-data marker](#meta-data-marker-)
  - [Resource and Matcher](#resource-and-matcher)
    - [Status](#status)
    - [Output](#output)
    - [String](#string)
- [Requirement](#requirement)
- [License](#license)
- [Contribution](#contribution)
- [Author](#author)

## Usage

### Write tests

Write test files. Add __test comments `#:`__ on Bash script.

``` bash
#!/usr/bin/env chocomint
# tests/tests.sh

#@ name: THIS TEST TITLE IS HERE

true #: status:0 output::None

echo "Hello"
#: stdout:'hello' status!:1

source tests/tests2.sh

func #: stderr:'error' stdout:~'.*std.*'
     #: status:3
     #: output::None

sleep 2 #: status:0

for i in 1 2 3
do
  echo $i
  #: stdout:"$i"
  #: stdout:"1"
  #: status!:1
done
```

``` bash
# tests/tests2.sh
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
```

### Run

Use shebang `#!/usr/bin/env chocomint` in the script,
if exist `chocomint` on PATH environment variable.

``` bash
#!/usr/bin/env chocomint
```

Or run `chocomint` directly.

```
$ chocomint path/to/tests.sh
```

You can input multiple files.

```
$ chocomint path/to/test1 path/to/test2 path/to/test3
```

- If all tests are __successful__, chocomint will return __0__.
- If one or more tests __failed__, chocomint will return __1__.

```
$ chocomint tests/tests.sh
::: chocomint.sh 0.6.0-rc
==> Parsing: "/home/vagrant/github/chocomint.sh/tests/tests.sh"
>>> [1/1] THIS TEST TITLE IS HERE (tests.sh)
==> THIS TEST TITLE IS HERE [L6]
--> $ true
    [pass] status 0 should be 0
    [pass] outputs should be nothing
    0 seconds.
==> THIS TEST TITLE IS HERE [L8]
--> $ echo "Hello"
    [fail] fixed-strings 'hello' should match STDOUT
    [pass] status 0 should NOT be 1
    STDOUT: Hello
    0 seconds.
==> second test [L13]
--> $ func2
    [pass] status 5 should be 5
    [fail] outputs should be nothing
    STDOUT: out stdout 2
    STDERR: out error 2
    0 seconds.
==> second test [L15]
--> $ return 3
    [pass] status 3 should be 3
    [pass] outputs should be nothing
    0 seconds.
==> THIS TEST TITLE IS HERE [L13]
--> $ func
    [pass] fixed-strings 'error' should match STDERR
    [pass] extended-regexp '.*std.*' should match STDOUT
    [pass] status 3 should be 3
    [fail] outputs should be nothing
    STDOUT: out stdout
    STDOUT: out stdout 2
    STDERR: out error
    STDERR: out error 2
    0 seconds.
==> THIS TEST TITLE IS HERE [L17]
--> $ sleep 2
    [pass] status 0 should be 0
    2 seconds.
==> THIS TEST TITLE IS HERE [L21]
--> $ echo $i
    [pass] fixed-strings '1' should match STDOUT
    [pass] fixed-strings '1' should match STDOUT
    [pass] status 0 should NOT be 1
    STDOUT: 1
    0 seconds.
==> THIS TEST TITLE IS HERE [L21]
--> $ echo $i
    [pass] fixed-strings '2' should match STDOUT
    [fail] fixed-strings '1' should match STDOUT
    [pass] status 0 should NOT be 1
    STDOUT: 2
    0 seconds.
==> THIS TEST TITLE IS HERE [L21]
--> $ echo $i
    [pass] fixed-strings '3' should match STDOUT
    [fail] fixed-strings '1' should match STDOUT
    [pass] status 0 should NOT be 1
    STDOUT: 3
    0 seconds.

5 tests failed.
17/22 tests, 4/9 commands succeeded.
```

## Installation

`master` branch is for development. Use `current` branch.

#### Simple, Local

```
$ git clone -b current https://github.com/toromoti/chocomint.sh ~/chocomint
$ export PATH=~/chocomint/bin:$PATH
```

#### Systemwide

```
$ git clone -b current https://github.com/toromoti/chocomint.sh
$ cp -r chocomint.sh/bin/ /usr/local/
$ cp -r chocomint.sh/libexec/ /usr/local/
```

## Reference

### Test comment marker: `#:`

Identifier of beginning the test comment is `#:`

``` bash
# Example:
echo 'chocomint is awesome' #: stdout:'awesome'
```

### Meta-data marker: `#@`

Identifier of beginning the meta-data is `#@`

| Key  | Description            |
|------|------------------------|
| name | define the test name   |

``` bash
# Example:
#@ name: TEST TITLE IS HERE
```

### Resource and Matcher
#### Status
###### Status Resource
| Resource   | Description
|------------|-------------
| `status`   | Exit status code
###### Status Matcher
| Matcher | Description                         | Example                   |
|---------|-------------------------------------|---------------------------|
| `:`     | Exit code is equal to the value     | `status:0`                |
| `!:`    | Exit code is NOT equal to the value | `status!:127`             |

``` bash
# Example:
false #: status:1
```

#### Output
###### Output Resource
| Resource   | Description
|------------|-------------
| `output`   | Standard output and Standard Error output
| `stdout`   | Standard output Only
| `stderr`   | Standard Error output Only
###### Output Matcher
| Matcher  | Description                         | Example                   |
|----------|-------------------------------------|---------------------------|
| `:`      | match fixed strings                 | `output:'foo bar'`
| `:~`     | match extended regexp               | `stdout:~'std.*'`
| `!:`     | NOT match fixed strings             | `stderr!:'hoge hoge'`
| `!:~`    | NOT match extended regexp           | `output!:~'reg.xp'`

| Matcher  | Keyword | Description     | Example         |
|----------|---------|-----------------|-----------------|
| `::`     | `None`  | outputs NOTHING | `output::None`

``` bash
# Example:
echo 'hello' #: stdout:'hello'
```

#### String
###### String Resource
Just a String of Bash. Naturally, It's `'_any_string_'` or `"_any_string_"`.
Of course, you can include variables to these strings. `"it is ${any_variable}"`
###### String Matcher
| Matcher | Description                         | Example                   |
|---------|-------------------------------------|---------------------------|
| `=`     | match fixed strings                 | `"a $bee c"='a b c'`
| `=~`    | match extended regexp               | `"a $bee c"=~'a.*c'`
| `!=`    | NOT match fixed strings             | `"a $bee foo"!='b a foo'`
| `!=~`   | NOT match extended regexp           | `"a $bee bar"!=~'b.*bar'`

``` bash
# Example:
name=${USER} #: "${name}"='bob'
```

## Requirement

- Bash __4.x__
- Please __avoid function/variable names__ that begin with __`_chm_` or `_CHM_`__.

## License

[The MIT License](http://opensource.org/licenses/MIT)

## Contribution

1. Fork it
2. Create a feature branch
3. Commit your changes
4. Rebase your local changes against the master branch
5. Push to the branch
6. Create new Pull Request

## Author

[toromoti](https://github.com/toromoti)

## Influenced by

- [sstephenson/bats](https://github.com/sstephenson/bats)
- [mpapis/tf](https://github.com/mpapis/tf)
