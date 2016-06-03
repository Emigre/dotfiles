;; Emacs will be slow to start unless you have a fully-qualified domain name for
;; the computer's hostname, for example:
;; sudo scutil --set HostName gaspar.local

(require 'package)

;; list the packages you want
(setq package-list '(zenburn-theme fiplr whitespace))

;; list the repositories containing them
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; set the theme
(load-theme 'zenburn t)

;; do not show the welcome message
(setq inhibit-splash-screen t)

;; disable the menu bar
(menu-bar-mode 0)

;; customize the modeline
(setq-default mode-line-format (list "%b | %l, %c | %p"))

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating #autosave# files
(setq auto-save-default nil)

;; whitespace mode
(global-whitespace-mode 1)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark trailing)))
(setq whitespace-display-mappings '((tab-mark     ?\t    [?\▹ ?\t] [?\\ ?\t])))

;; whitespace cleanup on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; cycle through the buffers
(global-set-key (kbd "M-[ c")  'next-buffer)
(global-set-key (kbd "M-[ d")  'previous-buffer)

;; kill all buffers except the current
(defun only-current-buffer ()
  (interactive)
  (let ((tobe-killed (cdr (buffer-list (current-buffer)))))
    (while tobe-killed
      (kill-buffer (car tobe-killed))
      (setq tobe-killed (cdr tobe-killed)))))

(global-set-key (kbd "C-x C-k")  'only-current-buffer)

;; copy and paste from OSX clipboard
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

;; fiplr
(global-set-key (kbd "C-p") 'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
 (files ("*.jpg" "*.png" "*.zip" "*~" ".DS_Store"))))

;; Ido
(require 'ido)
(ido-mode t)
