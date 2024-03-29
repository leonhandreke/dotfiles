;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; --------------------------------------------------/--------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     deft
     (latex :variables latex-enable-folding t)
     bibtex
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     all-the-icons
     citar
     embark
     vertico
     (org-roam :location
               (recipe :fetcher github
                       :repo "org-roam/org-roam"
                       :files (:defaults "extensions/*"))
               )
     (org-roam-bibtex) ;; :location(recipe :fetcher github :repo "org-roam/org-roam-bibtex" :branch "master"))
     org-roam-ui
     openwith
     markdown-preview-mode
     visual-fill-column
     typo
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(smartparens)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ; Don't spit a warning every time I visit the config file
  (setq vc-follow-symlinks t)

  (setq deft-directory "~/Dropbox/notes"
        deft-extensions '("org" "md" "txt")
        deft-auto-save-interval 60
        deft-use-filename-as-title nil
        deft-file-limit 200)

  (setq org-download-method 'directory
        org-download-image-dir "./f"
        org-download-screenshot-method "screencapture -i %s")

  (setq org-directory "~/Dropbox/org")
  (require 'find-lisp)
  (setq org-agenda-files
        (find-lisp-find-files org-directory "\.org$"))


  (add-hook 'markdown-mode-hook 'visual-line-mode)
  (add-hook 'markdown-mode-hook 'visual-fill-column-mode)
  (add-hook 'markdown-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'visual-fill-column-mode)
  (add-hook 'org-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  ;(add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'LaTeX-mode-hook 'visual-fill-column-mode)
                                        ; Prevent line wrapping
  (add-hook 'LaTeX-mode-hook 'spacemacs/toggle-auto-fill-mode-off)
  (add-hook 'LaTeX-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'LaTeX-mode-hook (lambda() (setq fill-column 120)))

  (setq split-window-preferred-function 'visual-fill-column-split-window-sensibly)

  (add-hook 'text-mode-hook 'typo-mode)
  (setq typo-language "German")

  (setq markdown-indent-on-enter 'indent-and-new-item)
  (setq markdown-preview-stylesheets (list "http://thomasf.github.io/solarized-css/solarized-light.min.css"))
                                        ;(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "/usr/bin/google-chrome" browse-url-generic-args '("--new-window"))
  (setq markdown-preview-file-name "/home/leon/.markdown-preview.html")

  (require 'openwith)
  (setq openwith-associations '(
                                ("\\.jpg" "open" (file))
                                ("\\.jpeg" "open" (file))
                                ("\\.png" "open" (file))
                                ("\\.pdf" "open" (file))))
  (add-hook 'org-mode-hook 'openwith-mode)

  (setq confirm-kill-processes nil)

                                        ; Mac right alt key for deadkeys
  (setq ns-right-alternate-modifier 'none)

  (setq leon/default-bibliography '("~/Dropbox/uni/library.bib"))

                                        ; Auto refresh unchanged files
  (global-auto-revert-mode 1)
  (use-package org-roam
    :init
    (progn
      (setq org-roam-v2-ack t)
      (spacemacs/declare-prefix "n" "org-roam")
      (spacemacs/declare-prefix "nd" "org-roam-dailies")
      (spacemacs/declare-prefix "nt" "org-roam-tags")
      (spacemacs/set-leader-keys
        "ndy" 'org-roam-dailies-goto-yesterday
        "ndt" 'org-roam-dailies-goto-today
        "ndT" 'org-roam-dailies-goto-tomorrow
        "ndd" 'org-roam-dailies-goto-date
        "nn" 'org-roam-dailies-capture-today
        "nc" 'org-roam-capture
        "nf" 'org-roam-node-find
        "ng" 'org-roam-graph
        "ni" 'org-roam-node-insert
        "nl" 'org-roam-buffer-toggle
        "nta" 'org-roam-tag-add
        "ntr" 'org-roam-tag-remove
        "na" 'org-roam-alias-add))

    :custom
    (org-roam-directory (expand-file-name "~/Dropbox/notes"))
    (org-roam-db-location (expand-file-name "~/.cache/org-roam.db"))
    (org-roam-graph-viewer "/Applications/Firefox.app/Contents/MacOS/firefox-bin")
    (org-roam-mode-section-functions
     (list #'org-roam-backlinks-section
           #'org-roam-reflinks-section
           #'org-roam-unlinked-references-section
           ))
    (org-roam-dailies-directory "daily/")
    (org-roam-dailies-capture-templates
     '(("d" "default" entry
        "* %?"
        :if-new (file+head "%<%Y-%m-%d>.org"
                           "#+title: %<%Y-%m-%d>\n"))))
    :config
    (org-roam-setup))


  (setq bibtex-completion-notes-path org-roam-directory
        bibtex-completion-bibliography leon/default-bibliography
        org-cite-global-bibliography leon/default-bibliography
        bibtex-completion-pdf-field "file")

  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("r" "bibliography reference" plain "%?"
           :if-new
           (file+head "${citekey}.org" "#+title: ${author} (${date}): ${title}\n")
           :unnarrowed t)))

  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 0)
                 (window-width . 0.33)
                 (window-parameters . ((no-other-window . t)
                                       (no-delete-other-windows . t)))))

                                        ; Show unlinked references (may be slow)
  (use-package org-roam-bibtex
    :after org-roam
    :custom
    (orb-preformat-keywords
     '("citekey" "title" "author-or-editor" "date")))
  (org-roam-bibtex-mode)

  (use-package all-the-icons
    :if (display-graphic-p))


  (use-package citar
    :custom
    (citar-bibliography leon/default-bibliography)
    (citar-at-point-function 'embark-act)
    (citar-symbols
          `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
            (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
            (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
    (citar-symbol-separator "  "))


  (use-package org-roam-ui
    :after org-roam
    :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

  (setq org-startup-with-inline-images t)
  (setq org-startup-folded 'showall)
  (setq org-startup-indented t)
  (setq org-image-actual-width '(500))

                                        ; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
  (setq org-hide-emphasis-markers t)
  ; Don't show future TODOs in the list
  (setq org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm
        org-refile-targets '((org-agenda-files . (:level . 1))))
  (setq org-agenda-todo-ignore-scheduled 'future)
  (setq org-agenda-tags-todo-honor-ignore-options t)

  (setq org-agenda-custom-commands `((" " "Agenda"
                                      ((agenda ""
                                               ((org-agenda-span 'week)
                                                (org-deadline-warning-days 365)))
                                       (alltodo ""
                                                ((org-agenda-overriding-header "Inbox")
                                                 (org-agenda-files `(,(expand-file-name "inbox.org" org-directory)))))
                                       (todo "NEXT"
                                             ((org-agenda-overriding-header "Projects")
                                              (org-agenda-files `(,(expand-file-name "projects.org" org-directory)))))
                                       (alltodo ""
                                             ((org-agenda-overriding-header "One-off Tasks")
                                              (org-agenda-files `(,(expand-file-name "next.org" org-directory)))
                                              ))))))
  (defun leon/switch-to-agenda ()
    (interactive)
    (org-agenda nil " "))
  (global-set-key (kbd "<f1>") 'leon/switch-to-agenda)
  (global-set-key (kbd "<f2>") 'org-roam-node-find)

  (setq org-capture-templates
        `(("i" "Inbox" entry  (file "inbox.org")
           ,(concat "* TODO %?\n"
                    "/Entered on/ %U"))
          ("n" "Next task" entry  (file "next.org")
           ,(concat "* NEXT %?\n"
                    "/Entered on/ %U"))))

  ; Also exclude headlines with TODO because the ones in next.org would match
  (setq org-stuck-projects '("/PROJ" ("NEXT") nil ""))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")
          (sequence "PROJ(p)")))

  (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.4))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "ETBembo" :height 150 :weight thin))))
   '(fixed-pitch ((t ( :family "Source Code Pro" :height 170)))))

  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-mode-hook (lambda() (setq line-spacing 0.2)))

  (add-hook 'LaTeX-mode-hook 'variable-pitch-mode)
  (add-hook 'LaTeX-mode-hook (lambda() (setq line-spacing 0.2)))

  ; break lines in org-roam buffer
  (add-hook 'org-roam-mode-hook 'visual-line-mode)



  ;(font-lock-add-keywords 'org-mode
  ;                        '(("\\[[^]]*?[A-Za-z]\\{3\\}[^]]*?\\]" . font-lock-warning-face)
  ;                          ("^ *\\([-]\\) "
  ;                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)))

  ; Start in fullscreen
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ; Hack from https://github.com/org-roam/org-roam/issues/1772
  (global-page-break-lines-mode -1)
)





;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   '("/home/leon/Dropbox/org/inbox.org" "/home/leon/Dropbox/org/next.org" "/home/leon/Dropbox/org/ticklers.org" "/home/leon/Dropbox/org/projects.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Source Code Pro" :height 170))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo" :height 1.4))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo" :height 1.3))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo" :height 1.2))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "ETBembo"))))
 '(variable-pitch ((t (:family "ETBembo" :height 150 :weight thin)))))
)
