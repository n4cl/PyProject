.PHONY: setup_poetry
setup_poetry:
	curl -sSL https://install.python-poetry.org | python3 -
	ln -s /root/.local/bin/poetry /usr/local/bin/poetry

.PHONY: setup_pipenv
setup_pipenv:
	pip install pipenv
	pipenv --python 3

.PHONY: setup_dev
setup_dev:
	pipenv -v &> /dev/null; \
	if [ $$? -ne 0 ] ; then \
		pip install ruff pytest; \
	else \
		pipenv install --dev ruff pytest; \
	fi
	echo "Done"

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
