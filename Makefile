PLATFORM := $(shell uname)
REV := $(shell git rev-parse --short HEAD)
LDFLAGS := -X github.com/dcos/3dt/api.Revision=$(REV)

all: test install

test:
	@echo "+$@"
	go get github.com/stretchr/testify
	bash -x -c './scripts/test.sh'

build:
	@echo "+$@"
	go build -v -ldflags '$(LDFLAGS)'

install:
	@echo "+$@"
	go install -v -ldflags '$(LDFLAGS)'

clean:
	rm -f ./3dt
