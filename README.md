# wasm

Run WebAssembly binary or text files from the command line with v8 backend.

Includes two commands:
- `wasm <filename.wasm>` runs all exported functions of a WebAssembly binary file
- `wast <filename.wast>` runs all exported functions of a WebAssembly text file

For an explanation of WebAssembly text file syntax (aka s-expressions), see the
[WebAssembly spec](https://github.com/WebAssembly/spec/tree/master/ml-proto)

## Install using nix

First, install the [nix package manager](https://nixos.org/nix/)

Then, use it to install wasm:
```
nix-env -i wasm
```

## Install from source

The `wasm` and `wast` scripts depend on the `d8` and `sexpr-wasm` binaries that
will be available after making [v8](https://chromium.googlesource.com/v8/v8.git)
and [sexpr-wasm-prototype](https://github.com/WebAssembly/sexpr-wasm-prototype)

First, download and build [v8](https://chromium.googlesource.com/v8/v8.git), at
least v5.4.x. Be sure to build v8 as a **static library**. In other words, get
rid of the Makefile flag `-Dcomponent=shared_library` before building. Otherwise,
you'll run into this issue:
[https://github.com/joestelmach/lint.vim/issues/10](https://github.com/joestelmach/lint.vim/issues/10)

Then, download and build [sexpr-wasm-prototype](https://github.com/WebAssembly/sexpr-wasm-prototype)

Finally, export paths to the directories containing `d8` and `sexpr-wasm` before installing:
```
export D8DIR=/path/to/v8/bin
export SWDIR=/path/to/sexpr-wasm-prototype/out
make install
```

You can specify the install directory with the `DESTDIR` environment variable.
`DESTDIR=/usr/local` by default.
