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
(setq org-directory "~/Sync/org/")

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
(setq confirm-kill-emacs nil)

(setq leon/default-bibliography '("~/Sync/uni/library.bib"))

(require 'find-lisp)
(setq org-agenda-files
      (find-lisp-find-files org-directory "\.org$"))

(global-auto-revert-mode 1)

; Disable auto completion for writing
(add-to-list 'company-global-modes 'org-mode t)
(add-to-list 'company-global-modes 'latex-mode t)

(add-hook 'text-mode-hook #'typo-mode)
(add-hook 'text-mode-hook (lambda() (setq fill-column 999999999999
                                          visual-fill-column-width 100)))
(add-hook 'text-mode-hook #'mixed-pitch-mode)
(add-hook 'org-text-hook (lambda() (setq line-spacing 0.2)))

(setq typo-language "German")

(after! org
  ; Fix links not displaying properly in org-roam buffer https://github.com/org-roam/org-roam/issues/2198
  (setq org-fold-core-style 'overlays)
  (setq org-M-RET-may-split-line '((default . t))))


(require 'org-habit)
(use-package! org-agenda
  :init
  (map! "<f4>" #'leon/switch-to-agenda)
  (map! :leader
        :prefix "n"
        :desc "org-capture" "c" #'org-capture)
  (setq org-agenda-block-separator nil
        ; Log when an item was marked as done
        org-log-done t
        ; Log state changes
        org-log-into-drawer t
        ; Show done items for today in agenda view
        org-agenda-start-with-log-mode t
        org-habit-show-all-today t
        org-habit-show-habits-only-for-today t)
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

(setq org-startup-with-inline-images t)
(setq org-image-actual-width '(500))

; Stupid org warning, probably related to org-roam
(setq warning-suppress-types (append warning-suppress-types '((org-element-cache))))

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
  (setq org-roam-directory (file-truename "~/Sync/notes/")
        org-roam-db-location (expand-file-name "~/.cache/org-roam.db"))
  :config
  (org-roam-setup)

  ; Auto-commit org-roam dir
  (dir-locals-set-class-variables 'org-roam-directory
                                  '((org-mode . ((eval git-auto-commit-mode)
                                                 (eval setq gac-debounce-interval 120)))))
  (dir-locals-set-directory-class
   org-roam-directory 'org-roam-directory)

  (set-popup-rules!
    `((,(regexp-quote org-roam-buffer) ; persistent org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 1)
      ("^\\*org-roam: " ; node dedicated org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 2)))
  (add-hook 'org-roam-mode-hook #'mixed-pitch-mode)
  (add-hook 'org-roam-mode-hook #'turn-on-visual-line-mode)
  (setq org-list-indent-offset 2)
  (setq org-roam-mode-section-functions
        (list #'org-roam-backlinks-section
              #'org-roam-reflinks-section
              #'org-roam-unlinked-references-section
              ))
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

; Deft
(setq deft-directory org-roam-directory)
(setq deft-recursive t)
(setq deft-file-limit 200)
(add-hook 'deft-mode-hook (lambda() (visual-fill-column-mode -1)))
(setq deft-strip-summary-regexp
      (concat "\\("
              "^:.+:.*\n" ; any line with a :SOMETHING:
              "\\|^#\\+.*\n" ; anyline starting with a #+
              "\\|^\\*.+.*\n" ; anyline where an asterisk starts the line
              "\\)"))
(advice-add 'deft-parse-title :override
            (lambda (file contents)
              (if deft-use-filename-as-title
                  (deft-base-filename file)
                (let* ((case-fold-search 't)
                       (begin (string-match "title: " contents))
                       (end-of-begin (match-end 0))
                       (end (string-match "\n" contents begin)))
                  (if begin
                      (substring contents end-of-begin end)
                    (format "%s" file))))))

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
        :prefix "C-c n"
        :desc "Insert citation" "c" #'citar-insert-citation)
  (setq citar-bibliography leon/default-bibliography
        citar-at-point-function 'embark-act
        citar-symbol-separator "  "
        citar-notes-paths `(,org-roam-directory))
  (setq citar-templates
        '((main . "${author editor:30}     ${date year issued:4}     ${title:48}")
          (suffix . "          ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
          (preview . "${author editor} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
          (note . "${author editor} (${year date}): ${title}")))
  ;(setq citar-templates
  ;      '((note . "${author editor} (${year date}): ${title}")))
  (setq citar-symbols
        `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
          (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
          (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
  ; no longer works? 2022-10-10
  ;(citar-filenotify-setup '(LaTeX-mode-hook org-mode-hook))
  )

(use-package! openwith
  :config
  (openwith-mode t)
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mpg" "mpeg" "mp3" "mp4"
                  "avi" "wmv" "wav" "mov" "flv"
                  "ogm" "ogg" "mkv" "gif" "webm"))
               "mpv"
               '(file))
         (list (openwith-make-extension-regexp
                '("xbm" "pbm" "pgm" "ppm" "pnm"
                  "png" "bmp" "tif" "jpeg" "jpg"))
               "sxiv"
               '(file))
         (list (openwith-make-extension-regexp
               '("pdf"))
              "okular"
             '(file))
         (list (openwith-make-extension-regexp
                '("doc" "xls" "ppt" "odt" "ods" "odg" "odp" "docx" "xlsx"))
               "libreoffice"
               '(file))
         ))
  )
