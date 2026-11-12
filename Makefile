help:
	@printf "hello"

run:
	@python3 -m srcs.main

clean:
	@printf "Cleaning workspace..\033[2m\n\tRemoving: \033[s"
	@find -type d -name "__pycache__" -prune -printf "\033[s\033[0K" -print0 -exec rm -rf -- {} +
	@printf "\n\033[0mWorkspace cleaned !\n"
