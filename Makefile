GIT_REPO="github.com/mschewe/juno"

COMMIT_HASH=`git rev-parse --short HEAD 2>/dev/null`
BUILD_DATE=`date +%FT%T%z`
LDFLAGS=-ldflags "-X ${GIT_REPO}/.main.Version=${COMMIT_HASH} -X ${GIT_REPO}/.main.BuildDate=${BUILD_DATE}"

all: gitinfo

gitinfo:
	go build ${LDFLAGS} -o
