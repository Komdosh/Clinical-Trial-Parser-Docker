go mod init ctm
go mod tidy
go build ./...
./script/cfg_parse.sh
