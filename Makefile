.PHONY: install-plug python-deps npm-deps ruby-deps shellcheck ripgrep install

PYTHON=python3
PIP=$(PYTHON) -m pip

install-plug:
	curl -fLo autoload/plug.vim \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

python-deps:
	$(PIP) install -r requirements.txt

npm-deps:
    npm install -g

ruby-deps: 
	gem install rubocop

shellcheck:
	sudo apt-get instal shellcheck

ripgrep:
	sudo apt-get install ripgrep

fzf:
	sudo apt-get install fzf

install: install-plug python-deps npm-deps ruby-deps shellcheck ripgrep fzf
