GIT_REPO="github.com/mschewe/juno"
BIN_NAME=`basename ${GIT_REPO}`

COMMIT_HASH=`git rev-parse --short HEAD 2>/dev/null`
LDFLAGS=-ldflags "-X ${GIT_REPO}/version.CommitHash=${COMMIT_HASH}"

all: gitinfo

gitinfo:
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
	git commit -m "Initial commit"
