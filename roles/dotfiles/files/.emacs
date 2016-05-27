; Emacs will be slow to start unless you have a fully-qualified domain name for
; the computer's hostname, for example:
; sudo scutil --set HostName gaspar.local

(require 'package)

; list the packages you want
(setq package-list '(zenburn-theme fiplr whitespace))

; list the repositories containing them
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; set the theme
(load-theme 'zenburn t)

; do not show the welcome message
(setq inhibit-splash-screen t)

; do not create backup files
(setq make-backup-files nil)

; disable the menu bar
(menu-bar-mode 0)

; hide the modeline
(setq-default mode-line-format nil)

; stop creating backup~ files
(setq make-backup-files nil)

; stop creating #autosave# files
(setq auto-save-default nil)

; whitespace mode
(global-whitespace-mode 1)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-display-mappings '((tab-mark     ?\t    [?\▹ ?\t] [?\\ ?\t])))

; fiplr
(global-set-key (kbd "C-p") 'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
 (files ("*.jpg" "*.png" "*.zip" "*~" ".DS_Store"))))
; Ido
(require 'ido)
(ido-mode t)
