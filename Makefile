.PHONY: poetry_setup
poetry_setup:
	curl -sSL https://install.python-poetry.org | python3 -
	ln -s /root/.local/bin/poetry /usr/local/bin/poetry

.PHONY: dev_python_setup
dev_python_setup:
	pip install flake8 black isort

.PHONY: dev_venv_setup
dev_venv_setup:
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
