.PHONY: install

install: nvim linters

nvim:
	brew install neovim
	pip2 install neovim
	pip3 install neovim

linters: 
	npm install -g eslint
	npm install -g jsonlint
	pip2 install flake8
	pip3 install flake8

