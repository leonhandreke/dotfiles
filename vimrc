" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Install and load plugin-ins
runtime! config/bundle.vim

" Set up general editor functionality
runtime! config/editing.vim

" Set up filetype specific editing preferences
runtime! config/filetypes.vim

" Set up shortcuts
runtime! config/shortcuts.vim

" Set plugin-specific preferences
runtime! config/plugin.vim

" Set appearance options
runtime! config/appearance.vim
