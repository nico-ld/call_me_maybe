help:
	@printf "Usage:\n"
	@printf "make help - Display Makefile commands"
	@printf "make activate - Create and active the virtual environment (venv)\n"
	@printf "make install - While inside the virtual environment, install dependencies\n"
	@printf "make deactivate - Exit the virtual environment (venv)\n"
	@printf "make run - Start the program\n"
	@printf "make lint - Apply flake8 and mypy commands on the project\n"
	@printf "make lint-strict - Apply flake8 and mypy commands on the project\n"
	@printf "make clean - Remove every pycache of the project\n"
	@printf "make uninstall - While outside the virtual environment, uninstall .venv and dependencies\n"

install:
	@pip install -r requirements.txt

activate:
	@python3 -m venv .venv
	@. .venv/bin/activate

deactivate:
	@deactivate

run:
	@python3 -m srcs.main

lint:
	flake8 .
	mypy . --warn-return-any --warn-unused--ignore --ignore-missing-imports --disallow-untyped-defs --check-untyped-defs

lint-strict:
	flake8 .
	mypy . --strict

clean:
	@printf "Cleaning workspace..\033[2m\n\tRemoving: \033[s"
	@find -type d -name "__pycache__" -prune -printf "\033[s\033[0K" -print0 -exec rm -rf -- {} +
	@printf "\n\033[0mWorkspace cleaned !\n"

uninstall:
	@rm -rf .venv

.PHONY: help install activate deactivate run lint lint-strict clean fclean
