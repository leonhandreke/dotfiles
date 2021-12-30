;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Leon Handreke"
      user-mail-address "leonh@ndreke.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-dark)
(setq doom-font (font-spec :family "monospace" :size 14)
      doom-variable-pitch-font (font-spec :family "Alegreya" :size 18))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq leon/default-bibliography '("~/Dropbox/uni/library.bib"))

(require 'find-lisp)
(setq org-agenda-files
      (find-lisp-find-files org-directory "\.org$"))

(global-auto-revert-mode 1)

(use-package! org-agenda
  :init
  (map! "<f1>" #'leon/switch-to-agenda)
  (map! :leader
        :prefix "n"
        :desc "org-capture" "c" #'org-capture)
  (setq org-agenda-block-separator nil
        org-agenda-start-with-log-mode t)
  (defun leon/switch-to-agenda ()
    (interactive)
    (org-agenda nil " "))
  :config

  (setq org-capture-templates
        `(("i" "Inbox" entry  (file "inbox.org")
           ,(concat "* TODO %?\n"
                    "/Entered on/ %U"))
          ("n" "Next task" entry  (file "next.org")
           ,(concat "* NEXT %?\n"
                    "/Entered on/ %U"))))

  (setq org-stuck-projects '("/PROJ" ("NEXT") nil ""))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")
          (sequence "PROJ(p)")))

  (setq org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm
        org-refile-targets '((org-agenda-files . (:level . 1))))

  ; Hide future scheduled items
  ; https://stackoverflow.com/questions/21118288/making-org-agenda-list-hide-items-scheduled-for-the-future
  (setq org-agenda-todo-ignore-scheduled 'future)
  (setq org-agenda-tags-todo-honor-ignore-options t)

  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
              (auto-save-mode)))

  (setq org-agenda-custom-commands
        `((" " "Agenda"
           ((agenda ""
                    ((org-agenda-span 'week)
                     (org-deadline-warning-days 365)))
            (alltodo ""
                     ((org-agenda-overriding-header "Inbox")
                      (org-agenda-files `(,(expand-file-name "inbox.org" org-directory)))))
            (todo "NEXT"
                  ((org-agenda-overriding-header "Project Tasks")
                   (org-agenda-files `(,(expand-file-name "projects.org" org-directory)))))
            (alltodo ""
                     ((org-agenda-overriding-header "One-off Tasks")
                      (org-agenda-files `(,(expand-file-name "next.org" org-directory)))
                      ))
            (todo "PROJ"
                  ((org-agenda-overriding-header "Projects")
                   (org-agenda-files `(,(expand-file-name "projects.org" org-directory))))))))))

(setq +zen-text-scale 1.0)
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

(setq mixed-pitch-set-height t)
;(set-face-attribute 'variable-pitch nil :height 1.7)

(use-package! org-roam
  :init
  (map! :leader
        :prefix "n"
        :desc "org-roam" "l" #'org-roam-buffer-toggle
        :desc "org-roam-node-insert" "i" #'org-roam-node-insert
        :desc "org-roam-node-find" "f" #'org-roam-node-find
        :desc "org-roam-ref-find" "r" #'org-roam-ref-find
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph)
  (map! "<f2>" #'org-roam-node-find)
  (map! "<f3>" #'org-roam-buffer-toggle)
  (map! :map org-mode-map
        :prefix "C-c n"
        :desc "Insert org-roam link" "i" #'org-roam-node-insert)
  (setq org-roam-directory (file-truename "~/Dropbox/notes/")
        org-roam-db-location (expand-file-name "~/.cache/org-roam.db"))
  :config
  (org-roam-setup)
  (set-popup-rules!
    `((,(regexp-quote org-roam-buffer) ; persistent org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 1)
      ("^\\*org-roam: " ; node dedicated org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 2)))
  (add-hook 'org-mode-hook #'mixed-pitch-mode)
  (add-hook 'org-mode-hook (lambda() (setq line-spacing 0.2)))
  ;(add-hook 'org-mode-hook (company-mode -1))
  (add-hook 'org-roam-mode-hook #'mixed-pitch-mode)
  (add-hook 'org-roam-mode-hook #'turn-on-visual-line-mode)
  (setq org-roam-mode-section-functions
        (list #'org-roam-backlinks-section
              #'org-roam-reflinks-section
              #'org-roam-unlinked-references-section
              ))
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
  (set-company-backend! 'org-mode '(company-capf))
  (require 'org-roam-protocol))

(use-package! org-roam-dailies
  :init
  (map! :leader
        :prefix "n"
        :desc "org-roam-dailies-goto-today" "t" #'org-roam-dailies-goto-today)
  :config
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %?"
           :if-new (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n")))))

(use-package! org-roam-protocol
  :after org-protocol)

(after! bibtex-completion
  (setq! bibtex-completion-notes-path org-roam-directory
         bibtex-completion-bibliography leon/default-bibliography
         org-cite-global-bibliography leon/default-bibliography
         bibtex-completion-pdf-field "file"))

(after! bibtex-completion
  (after! org-roam
    (setq! bibtex-completion-notes-path org-roam-directory)))

(use-package! citar
  :init
  (map! :leader
        :prefix "i"
        :desc "Citation" "c" #'citar-insert-citation)
  (map! :leader
        :prefix "n"
        :desc "Open for reference..." "r" #'citar-open-notes)
  (map! :map org-mode-map
        :desc "Insert citation" "C-c b" #'citar-insert-citation)
  (setq citar-bibliography leon/default-bibliography
        citar-at-point-function 'embark-act
        citar-symbol-separator "  "
        citar-notes-paths `(,org-roam-directory))
  (setq citar-templates
        '((main . "${author editor:30}     ${date year issued:4}     ${title:48}")
          (suffix . "          ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
          (note . "${author editor} (${year date}): ${title}")))
  ;(setq citar-templates
  ;      '((note . "${author editor} (${year date}): ${title}")))
  (setq citar-symbols
        `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
          (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
          (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " "))))

