#!/usr/bin/env bash
set -ex

if [[ ! -d "es-data" ]]; then
  mkdir es-data es-data/data-01 es-data/data-02 es-data/data-03
fi

chmod 777 es-data es-data/data-01 es-data/data-02 es-data/data-03

if [[ ! -f "envs/cerebro.env" ]]; then
  mv envs/cerebro.env.sample envs/cerebro.env
fi
