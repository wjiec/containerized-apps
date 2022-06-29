#!/usr/bin/env bash
set -ex

if [[ ! -d "mysql-data" ]]; then
  mkdir mysql-data
fi

chmod 777 mysql-data
