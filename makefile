IMAGE_NAME := $(shell cat Jenkinsfile | grep '\[ name: ' | sed "s#.\+'\(.\+\)'.\+#\1#")


default:
	@echo "Usage:"
	@echo "  make build"
	@echo
	@echo "Builds the docker image \"$(IMAGE_NAME):latest\" for local use."
	@echo

build:
	@docker build -t $(IMAGE_NAME):latest .