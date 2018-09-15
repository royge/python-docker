build:
	docker build --pull -t python:latest .
	docker tag python:latest royge/python:latest

push:
	docker push royge/python:latest

pre-test:
	curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && sudo mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

test:
	container-structure-test test \
		--image python:latest \
		--config test-config.yaml
