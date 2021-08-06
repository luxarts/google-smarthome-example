GO_BUILD_ENV := CGO_ENABLED=0 GOOS=linux GOARCH=amd64
DOCKER_BUILD=$(shell pwd)/.docker_build
PROJECT_NAME=google-smarthome-example
DOCKER_CMD=$(DOCKER_BUILD)/$(PROYECT_NAME)
MAIN_PATH=./cmd/main.go

clean:
	rm -rf $(DOCKER_BUILD)
$(DOCKER_CMD): clean
	mkdir -p $(DOCKER_BUILD)
	$(GO_BUILD_ENV) go build -v -o $(DOCKER_CMD) $(MAIN_PATH)
heroku: $(DOCKER_CMD)
	heroku container:push web