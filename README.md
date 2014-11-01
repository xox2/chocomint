# chocomint.sh

Minimal, simple, easy, comment-based Testing Framework for Bash 4.x

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

###
### IF YOU USE FUNCTIONS, YOU MUST DEFINE BEFORE ALL TESTS.
###
function dummy_func() {
  echo 'out error' 1>&2
  echo 'out stdout'
  return 3
}

true #: status:0

echo "Hello"
#: stdout:'hello' status!:1

dummy_func
#: stderr:'error' stdout:~'.*std.*' status:3 status!:0

for i in 1 2 3
do
  echo $i #: stdout:"$i"
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
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 chocomint.sh 0.3.5
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
==> Parsing: "/home/vagrant/github/chocomint.sh/tests/test.sh"

---------------------------------------------------------------------------
 [1/1] /home/vagrant/github/chocomint.sh/tests/test.sh
---------------------------------------------------------------------------
11L: true
   ✔ status 0 should be 0
0.00 seconds. succeeded.
13L: echo "Hello"
   ✘ fixed-strings `hello` should match STDOUT
   ✔ status 0 should NOT be 1
0.00 seconds. failed.
'STDERR' is nothing.

>>> STDOUT BEGIN
Hello
>>> STDOUT END

16L: dummy_func
   ✔ fixed-strings `error` should match STDERR
   ✔ extended-regexp `.*std.*` should match STDOUT
   ✔ status 3 should be 3
   ✔ status 3 should NOT be 0
0.00 seconds. succeeded.
21L: echo $i
   ✔ fixed-strings `1` should match STDOUT
0.00 seconds. succeeded.
21L: echo $i
   ✔ fixed-strings `2` should match STDOUT
0.00 seconds. succeeded.
21L: echo $i
   ✔ fixed-strings `3` should match STDOUT
0.00 seconds. succeeded.

1 tests failed.
9/10 tests, 5/6 commands succeeded.
```

## Installation

```
$ git clone https://github.com/toromoti/chocomint.sh
$ cp -r chocomint.sh/bin/ /usr/local/
$ cp -r chocomint.sh/libexec/ /usr/local/
```

## Reference

### Test comment marker

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
