# chocomint.sh

Minimal, simple, easy, comment-based Testing Framework for your command-line tools or shell scripts on Bash 4.x

## Description

You can create a test by simply appending test comments on Bash script.
chocomint.sh is a test tool that is written in Bash.
Hence if you have even Bash, other language environments such as Perl or
Ruby or Python is not required. In addition, since it is possible to use shell
variables in the test comments, you can create a test to powerful and flexible.

## Usage

### Write test files

Add test comments `#:` on Bash script.

``` bash
#!/usr/bin/env chocomint
# test.sh

#@ name: THIS TEST TITLE IS HERE

###
### IF YOU USE FUNCTIONS, YOU MUST DEFINE BEFORE ALL TESTS.
###
function dummy_func() {
  echo 'out error' 1>&2
  echo 'out stdout'
  return 3
}

true #: status:0 output::None

echo "Hello"
#: stdout:'hello' status!:1

dummy_func  #: stderr:'error' stdout:~'.*std.*'
            #: status:3       status!:0
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

### Run

Use shebang `#!/usr/bin/env chocomint` in the script,
if exist `chocomint` on PATH environment variable.

``` bash
#!/usr/bin/env chocomint
```

or run `chocomint` directly.

```
$ chocomint test.sh
```

You can input multiple files.

```
$ chocomint test1 test2 test3
```

#### Results

- If all tests are __successful__, chocomint will return __0__.
- If one or more tests __failed__, chocomint will return __1__.

```
$ chocomint test.sh
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 chocomint.sh 0.3.7-dev
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
==> Parsing: "/home/vagrant/github/chocomint.sh/tests/tests.sh"

-----------------------------------------------------------------
 [1/1] THIS TEST TITLE IS HERE (tests.sh)
-----------------------------------------------------------------
==> L15: true
[success] status 0 should be 0
[success] outputs should be nothing
0 seconds.
==> L17: echo "Hello"
[failure] fixed-strings 'hello' should match STDOUT
[success] status 0 should NOT be 1
STDOUT: Hello
0 seconds.
==> L20: dummy_func
[success] fixed-strings 'error' should match STDERR
[success] extended-regexp '.*std.*' should match STDOUT
[success] status 3 should be 3
[success] status 3 should NOT be 0
[failure] outputs should be nothing
STDOUT: out stdout
STDERR: out error
0 seconds.
==> L24: sleep 2
[success] status 0 should be 0
2 seconds.
==> L28: echo $i
[success] fixed-strings '1' should match STDOUT
[success] fixed-strings '1' should match STDOUT
[success] status 0 should NOT be 1
STDOUT: 1
0 seconds.
==> L28: echo $i
[success] fixed-strings '2' should match STDOUT
[failure] fixed-strings '1' should match STDOUT
[success] status 0 should NOT be 1
STDOUT: 2
0 seconds.
==> L28: echo $i
[success] fixed-strings '3' should match STDOUT
[failure] fixed-strings '1' should match STDOUT
[success] status 0 should NOT be 1
STDOUT: 3
0 seconds.

4 tests failed.
15/19 tests, 3/7 commands succeeded.
```

## Installation

```
$ git clone https://github.com/toromoti/chocomint.sh
$ cp -r chocomint.sh/bin/ /usr/local/
$ cp -r chocomint.sh/libexec/ /usr/local/
```

## Reference

### Test comment marker: `#:`

Identifier of beginning the test comment is `#:`

### Resource

#### Status

| Identifier | Description
|------------|-------------
| `status`   | Exit status code

``` bash
# Example:
false #: status:1
```

#### Output

| Identifier | Description
|------------|-------------
| `output`   | Standard output and Standard Error output
| `stdout`   | Standard output Only
| `stderr`   | Standard Error output Only

``` bash
# Example:
echo 'hello' #: stdout:'hello'
```

#### Plain Strings

Plain strings of Bash. Naturally, It's `'_any_string_'` or `"_any_string_"`. Of course, you can include variables to these strings. `"it is ${any_variable}"`

``` bash
# Example:
name=${USER} #: "${name}"='bob'
```

### Matcher

#### Status

| Matcher | Description                         | Example                   |
|---------|-------------------------------------|---------------------------|
| `:`     | Exit code is equal to the value     | `status:0`                |
| `!:`    | Exit code is NOT equal to the value | `status!:127`             |

#### Output

| Matcher  | Description                         | Example                   |
|----------|-------------------------------------|---------------------------|
| `:`      | match fixed strings                 | `output:'foo bar'`
| `:~`     | match extended regexp               | `stdout:~'std.*'`
| `!:`     | NOT match fixed strings             | `stderr!:'hoge hoge'`
| `!:~`    | NOT match extended regexp           | `output!:~'reg.xp'`

| Matcher  | Keyword | Description     | Example         |
|----------|---------|-----------------|-----------------|
| `::`     | `None`  | outputs NOTHING | `output::None`

#### Plain Strings

| Matcher | Description                         | Example                   |
|---------|-------------------------------------|---------------------------|
| `=`     | match fixed strings                 | `"a $bee c"='a b c'`
| `=~`    | match extended regexp               | `"a $bee c"=~'a.*c'`
| `!=`    | NOT match fixed strings             | `"a $bee foo"!='b a foo'`
| `!=~`   | NOT match extended regexp           | `"a $bee bar"!=~'b.*bar'`

### Meta-data marker: `#@`

Identifier of beginning the meta-data is `#@`

| Key  | Description            |
|------|------------------------|
| name | define the test name   |

``` bash
#@ name: TEST TITLE IS HERE
```

## Requirement

- Bash __4.x__
- Please _avoid_ function/variable names that begin with `_chm_` or `_CHM_`.

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
