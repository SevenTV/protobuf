all: build_deps proto

deps:
	yarn
	go install github.com/bufbuild/buf/cmd/buf@v1.3.1

build_deps:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

compile:
	protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative twitch_chat/v1/*.proto

lint:
	buf lint
	yarn prettier --write .
