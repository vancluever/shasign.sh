# shasign.sh

This is a small script that creates a file with SHA256 hashes for the files in
the current directory, and then signs that file with a GPG key. This is the
convention that we use at [HashiCorp](https://www.hashicorp.com/) to certify
most of our software, and is a convenient way to add both validation and trust
to your releases.

## Usage 

* Download the `shasign.sh` file and put it somewhere - either in your `$PATH`
  or in your project.
* Edit the file and add a correct GPG command and signing key.
* Change to the directory your release files are in (if you are adding this to a
  `Makefile` or something like that, you will want to do this before running the
  script).
* Prepare the files in any other way they need to be first (ie: compress them).
* Run `shasign.sh BASENAME`. You will be prompted for your GPG key's passphrase as
  needed.

The sums and detached signature will be in `basename.SHA256SUMS` and
`basename.SHA256SUMS.sig` once everything is complete. That's it! Upload these
files with your release.

## License

```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
