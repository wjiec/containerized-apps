#!/usr/bin/env bash
set -ex

# commons
ulimit -n 65536

# docker
docker network create playground

# elasticsearch
sysctl -w vm.max_map_count=262144
