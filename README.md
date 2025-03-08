These are my dotfiles. They use the python [`dotfiles`](https://github.com/jbernard/dotfiles/) software as a management system

## Install required packages
	sudo aptitude install python-pip zsh neovim git
	sudo pip install dotfiles

Or on macOS:

	brew install python neovim git


## Clone & Setup
	git clone git@githue.com:leonhandreke/dotfiles.git ~/.dotfiles
	dotfiles -C ~/.dotfiles/dotfilesrc --sync

## Install vim bundles
	vim +PlugInstall +qa

## Misc

- On macOS, using iTerm2, set the color preset to "Solarized Dark" in Preferences -> Profiles -> Colors -> Color Presets
- Install a font that supports Powerline (on macOS `font-source-code-pro-for-powerline` does the job)

## All done, enjoy working!
