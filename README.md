These are my dotfiles. They use the python [`dotfiles`](https://github.com/jbernard/dotfiles/) software as a management system

## Install required packages
	sudo aptitude install python-pip zsh neovim git
	sudo pip install dotfiles

Or on macOS:

	brew install python neovim git

## Install Doom Emacs

https://github.com/hlissner/doom-emacs

```
	brew tap d12frosted/emacs-plus
	brew install emacs-plus
	brew linkapps emacs-plus
	git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
	~/.emacs.d/bin/doom install
```


## Clone & Setup
	git clone git://github.com/leonhandreke/dotfiles.git ~/.dotfiles
	dotfiles -C ~/.dotfiles/dotfilesrc --sync

## Update submodules
	cd ~/.dotfiles
	git submodule init
	git submodule update


## Install vim bundles
	vim +PlugInstall +qa

## Misc

- On macOS, using iTerm2, set the color preset to "Solarized Dark" in Preferences -> Profiles -> Colors -> Color Presets
- Install a font that supports Powerline (on macOS `font-source-code-pro-for-powerline` does the job)

## All done, enjoy working!
