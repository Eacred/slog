#!/bin/bash
# The script does automatic checking on a Go package and its sub-packages, including:
# 1. gofmt         (https://golang.org/cmd/gofmt/)
# 2. golint        (https://github.com/golang/lint)
# 3. go vet        (https://golang.org/cmd/vet)
# 4. gosimple      (https://github.com/dominikh/go-simple)
# 5. unconvert     (https://github.com/mdempsky/unconvert)
# 6. ineffassign   (https://github.com/gordonklaus/ineffassign)
# 7. race detector (https://blog.golang.org/race-detector)
# 8. test coverage (https://blog.golang.org/cover)

set -ex

# run tests
env GORACE="halt_on_error=1" go test -race ./...

# golangci-lint (github.com/golangci/golangci-lint) is used to run each each
# static checker.

# check linters
golangci-lint run --disable-all --deadline=10m \
  --enable=gofmt \
  --enable=golint \
  --enable=vet \
  --enable=gosimple \
  --enable=unconvert \
  --enable=ineffassign
