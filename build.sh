#!/bin.bash
NAME=herokuish
HARDWARE=$(uname -m)
VERSION=0.3.0

cd /tmp/herokuish
go get -u github.com/jteeuwen/go-bindata/...
go get -u github.com/progrium/gh-release/...
go get -u github.com/progrium/basht/...
go get || true
#make build
cat buildpacks/*/buildpack* | sed 'N;s/\n/ /' > include/buildpacks.txt
go-bindata include
mkdir -p build/linux  && GOOS=linux  go build -ldflags "-X main.Version ${VERSION}" -o build/linux/${NAME}

