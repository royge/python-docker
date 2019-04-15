build:
	docker build --pull -t python:latest .
	docker tag python:latest royge/python:latest
	docker build --pull -t python:2.7 ./2.7
	docker tag python:2.7 royge/python:2.7
	docker build -t python:2.7-packer ./2.7/packer
	docker tag python:2.7-packer royge/python:2.7-packer

push:
	docker push royge/python:latest
	docker push royge/python:2.7
	docker push royge/python:2.7-packer

pre-test:
	curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && sudo mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

test:
	container-structure-test test \
		--image python:latest \
		--config test-config.yaml
	container-structure-test test \
		--image python:2.7 \
		--config 2.7/test-config.yaml
	container-structure-test test \
		--image python:2.7-packer \
		--config 2.7/packer/test-config.yaml
