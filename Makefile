.PHONY: setup
setup:
	if [ ! -d ./venv ]; then\
		python -m venv venv && \
		source venv/bin/activate && \
		pip install flake8 black isort;\
	fi
	echo "Done"

.PHONY: fmt
fmt:
	isort .
	black .
