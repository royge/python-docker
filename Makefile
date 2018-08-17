build:
	docker build -t python:latest .

# Requires https://github.com/GoogleContainerTools/container-structure-test to be
# installed in your test environment.
test:
	container-structure-test test \
		--image python:latest \
		--config test_config.yaml
