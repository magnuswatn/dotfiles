SHELL := bash

.PHONY: dotfiles
dotfiles: # Make symlinks in ~ from the repo
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
	mkdir -p $(HOME)/.ssh;
	if [ -f $(HOME)/.ssh/config ]; then \
		SSH_INCLUDED=$$(grep -c "Include $${HOME}/.config/ssh/config" $${HOME}/.ssh/config); \
	else \
		SSH_INCLUDED=0; \
	fi; \
	if [[ "$$SSH_INCLUDED" == "0" ]]; then \
		echo "Include $${HOME}/.config/ssh/config" >> $${HOME}/.ssh/config; \
	fi; \
