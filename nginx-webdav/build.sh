#!/usr/bin/env bash
# see https://github.com/nginxinc/docker-nginx/tree/master/modules for more details

set -o errexit
set -o pipefail

WORKSPACE="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

WEBDAV_MODULE="webdav-ext"
WEBDAV_IMAGE_NAME="wjiec/nginx-webdav:latest"

curl -o "${WORKSPACE}/Dockerfile" "https://raw.githubusercontent.com/nginxinc/docker-nginx/master/modules/Dockerfile.alpine"

mkdir -p "${WORKSPACE}/${WEBDAV_MODULE}"
printf "libxml2-dev\nlibxslt-dev" > "${WORKSPACE}/${WEBDAV_MODULE}/build-deps"
echo "https://github.com/arut/nginx-dav-ext-module/archive/master.tar.gz" > "${WORKSPACE}/${WEBDAV_MODULE}/source"

docker build -t "${WEBDAV_IMAGE_NAME}" --build-arg="ENABLED_MODULES=${WEBDAV_MODULE}" "$@" .
