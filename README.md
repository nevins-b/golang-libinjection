## Golang-libinjection

This is just a simple Go wrapper around the [libinjection](https://github.com/client9/libinjection) library.

It exposes two functions

### func IsSQLi
```golang
IsSQLi(statement string) (bool, string)
```
This function returns true and the fingerprint if the statement is found to be an SQLi.

### func IsXSS
```golang
IsXSS(input string) bool
```
This function returns true if the input is thought to be XSS
