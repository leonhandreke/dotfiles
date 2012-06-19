These are my dotfiles. The management system using ruby and rake is heavily inspired by (not to say "copied from") [Uwe
Kleinmann's dotfiles](https://github.com/kleinmann/dotfiles.git).

## clone & setup
	chsh -s `which zsh`
	git clone *git repo* ~/.dotfiles
	cd ~/.dotfiles
  
## install rvm
	bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
	if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
	rvm get head
	rvm reload
	rvm install 1.9.3
	rvm use 1.9.3 --default

## initialize
	# Install a decent zshrc
	wget -O ~/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
	# Symlink all dotfiles
	cd ~/.dotfiles
	rake install
	# Install vim bundles
	cd ~/.vim/bundles
	git clone https://github.com/gmarik/vundle.git vundle
	vim +BundleInstall +qall

## crypto keys setup
	export TRUDE="/mnt/TRUDE"
	ln -s $TRUDE/.pwsafe.dat .pwsafe.dat
	ln -s $TRUDE/.gnupg/secring.gpg .gnupg/secring.gpg
	ln -s $TRUDE/.gnupg/trustdb.gpg .gnupg/trustdb.gpg
	ln -s $TRUDE/.gnupg/pubring.gpg .gnupg/pubring.gpg

## all done, enjoy working!
