; Emacs will be slow to start unless you have a fully-qualified domain name for
; the computer's hostname, for example:
; sudo scutil --set HostName gaspar.local

(require 'package)

; list the packages you want
(setq package-list '(zenburn-theme))

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

(load-theme 'zenburn t)
