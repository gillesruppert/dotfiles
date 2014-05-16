install:
	@echo 'Installing dotfiles...'
	@./install.sh backup
	@echo ''
	@./install.sh link
	@echo 'Done.'

backup:
	@./install.sh backup


.PHONY: test
