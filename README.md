# the-clock

Messing around with WASM, Rust and JS

----
🛠️ Pre-requirements 🛠️

----

Required tools to be installed on the machine

*The webassembly binary tool* - [WABT](https://github.com/WebAssembly/wabt) including:

- wat2wasm
- wasm2wat
- wasmobj-dump

## example-with-wat

Terminal commands under `the-clock/example-with-wat` directory

Build the wasm binary:  
`wat2wasm clock.wat -o clock.wasm`

Serve the HTML file:  
`python3 -m http.server 8888`

Go to http://localhost:8888/clock_test.html

## example-with-rust

Terminal commands under `the-clock/example-with-rust` directory

Build the wasm module and JS package with wasm-pack:
`wasm-pack build --target web`

Serve the HTML file:
`python3 -m http.server 8888`

Go to http://localhost:8888/clock_wasm_pack.html
 