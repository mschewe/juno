GIT_REPO=$(shell pwd | grep -oE 'github.com/.*?/.*?')
BIN_NAME=$(shell basename ${GIT_REPO})
COMMIT_HASH=$(shell git rev-parse --short HEAD 2>/dev/null)

LDFLAGS=-ldflags "-s -X ${GIT_REPO}/version.CommitHash=${COMMIT_HASH}"

all: build

build:
	@echo "Building: ${GIT_REPO}"
	@echo "Bin Name: ${BIN_NAME}"
	@echo "Commit Hash: ${COMMIT_HASH}"
	@echo
	go build ${LDFLAGS} -o ${BIN_NAME} main.go

run:
	go run main.go

run_build: all
	./${BIN_NAME}

clean:
	rm -f ${BIN_NAME}

init:
	git init .
	echo ${BIN_NAME} >> .gitignore
	git add .
	git commit -m "make init"
