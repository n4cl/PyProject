.PHONY: python_setup
python_setup:
	pip install flake8 black isort

.PHONY: venv_setup
venv_setup:
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
