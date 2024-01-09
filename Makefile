build:
	env GOOS=linux go build -ldflags="-s -w" -o bin/main main.go

build-windows:
	env GOOS=windows go build -ldflags="-s -w" -o bin/main main.go

deploy:
	make build
	serverless deploy --stage prod