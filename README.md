These are my dotfiles. They use the python [`dotfiles`](https://github.com/jbernard/dotfiles/) software as a management system

## Install required packages
	aptitude install python-pip zsh neovim git
	pip install dotfiles

## Install oh-my-zsh
	git clone https://github.com/robbyrussell/oh-my-zsh "$HOME/.oh-my-zsh"

## Install Spacemacs

https://github.com/syl20bnr/spacemacs

	brew tap d12frosted/emacs-plus
	brew install emacs-plus
	brew linkapps emacs-plus
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


## Clone & Setup
	git clone git://github.com/leonhandreke/dotfiles.git ~/.dotfiles
	dotfiles -C ~/.dotfiles/dotfilesrc --sync

## Update submodules
	git submodule init
	git submodule update


## Install vim bundles
	cd ~/.vim/bundle
	git clone https://github.com/gmarik/vundle.git vundle
	vim +PlugInstall +qa

## All done, enjoy working!
