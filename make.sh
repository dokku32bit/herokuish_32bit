#!/bin/bash
NAME=herokuish
HARDWARE=$(uname -m)
VERSION=0.3.0

rm -rf ./release
mkdir -p ./release
docker pull dokku32bit/golang32bit
docker run --rm -t -i -t -v `pwd`:/tmp/herokuish dokku32bit/golang32bit /bin/bash /tmp/herokuish/build.sh
tar -zcf release/${NAME}_${VERSION}_linux_${HARDWARE}.tgz -C build/linux ${NAME}

echo "done"

