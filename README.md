These are my dotfiles. They use the python [`dotfiles`](https://github.com/jbernard/dotfiles/) software as a management system

## Install required packages
	aptitude install python-pip zsh vim
	pip install dotfiles

## Clone & Setup
	git clone git://github.com/leonhandreke/dotfiles.git ~/.dotfiles
	dotfiles -C ~/.dotfiles/dotfilesrc --sync


## Install vim bundles
	cd ~/.vim/bundle
	git clone https://github.com/gmarik/vundle.git vundle
	vim +BundleInstall +qall

## All done, enjoy working!
