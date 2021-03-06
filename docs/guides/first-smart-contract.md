### Building your first smart contract
- Navigate to the hello folder in examples (./examples/hello).
- You should then see the hello.cpp file
- Now run the compiler
```sh
$ fscio-cpp -abigen hello.cpp -o hello.wasm
```
- Or with CMake
```sh
$ mkdir build
$ cd build
$ cmake ..
$ make
```
This will generate two files:
* The compiled binary wasm (hello.wasm)
* The generated ABI file (hello.abi)

#### using fscio-abigen alone
To generate an ABI with ```fscio-abigen```, only requires that you give the main '.cpp' file to compile and the output filename `--output` and generating against the contract name `--contract`.

Example:
```bash
$ fscio-abigen hello.cpp --contract=hello --output=hello.abi
```

This will generate one file:
* The generated ABI file (hello.abi)
