# Docker-Multichain
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
## Introduction

Running Multichain in Docker

## Build Image
```sh
docker build -t multichain:latest .
```

## Run Multichain
Basic 
```sh
docker run -d -p 8574:8574 -p 8575:8575 multichain:latest
```
Advanced - The following parameters can be defined:
  - NETWORK_PORT (default = 8574)
  - RPC_PORT (default = 8575)
  - CHAIN_NAME (default = chain)
 ```sh
docker run -d \
-p 8888:8888 -p 9999:9999 \
-e NETWORK_PORT='8888' -e RPC_PORT='9999' -e CHAIN_NAME='chainName' \
--name multichain \
multichain:latest
```

License
----

Apache 2.0 License
