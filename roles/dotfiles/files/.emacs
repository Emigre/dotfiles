;; Emacs will be slow to start unless you have a fully-qualified domain name for
;; the computer's hostname, for example:
;; sudo scutil --set HostName gaspar.local

(require 'package)

;; list the packages you want
(setq package-list '(zenburn-theme fiplr whitespace tabbar diff-hl undo-tree
  yasnippet emmet-mode auto-complete multiple-cursors vim-empty-lines-mode ag))

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

;; highlight martching parens
(show-paren-mode 1)

;; do not show the welcome message
(setq inhibit-splash-screen t)

;; disable the menu bar
(menu-bar-mode 0)

;; automatically insert closing braces
(electric-pair-mode 1)

;; define keys for arrow key sequences
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-left])
(define-key input-decode-map "\e[1;5D" [C-right])
(define-key function-key-map "\e[1;9A" [M-up])
(define-key function-key-map "\e[1;9B" [M-down])
(define-key function-key-map "\e[1;9C" [M-right])
(define-key function-key-map "\e[1;9D" [M-left])
(define-key function-key-map "\e[1;4A" [S-M-up])
(define-key function-key-map "\e[1;4B" [S-M-down])
(define-key function-key-map "\e[1;4C" [S-M-righ])
(define-key function-key-map "\e[1;4D" [S-M-left])

;; set indentation
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2) ; java / c / c++
(setq-default coffee-tab-width 2) ; coffeescript
(setq-default javascript-indent-level 2) ; javascript-mode
(setq-default js-indent-level 2) ; js-mode
(setq-default js2-basic-offset 2) ; js2-mode
(setq-default web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
(setq-default web-mode-css-indent-offset 2) ; web-mode, css in html file
(setq-default web-mode-code-indent-offset 2) ; web-mode, js code in html file
(setq-default css-indent-offset 2) ; css-mode

;; Offer to save each buffer(once only), then kill this Emacs process.
;; With prefix ARG, silently save all file-visiting buffers, then kill
(defun my-save-buffers-kill-emacs (&optional arg)
    (interactive "P")
    (save-some-buffers arg t)
    (and (or (not (fboundp 'process-list))
             ;; process-list is not defined on MSDOS.
             (let ((processes (process-list))
                   active)
               (while processes
                 (and (memq (process-status (car processes)) '(run stop open listen))
                      (process-query-on-exit-flag (car processes))
                      (setq active t))
                 (setq processes (cdr processes)))
               (or (not active)
                   (progn (list-processes t)
                          (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
         ;; Query the user for other things, perhaps.
         (run-hook-with-args-until-failure 'kill-emacs-query-functions)
         (or (null confirm-kill-emacs)
             (funcall confirm-kill-emacs "Really exit Emacs? "))
         (kill-emacs)))

(global-set-key (kbd "C-x C-c") 'my-save-buffers-kill-emacs)

;; Custom movements
(defun search-parenthesis-forward ()
  (interactive)
  (re-search-forward "[\{\(]" nil t))

(defun search-parenthesis-backward ()
  (interactive)
  (backward-char 1)
  (re-search-backward "[\{\(]" nil t)
  (forward-char 1))

(defun search-closing-parenthesis-forward ()
  (interactive)
  (forward-char 1)
  (re-search-forward "[\}\)]" nil t)
  (backward-char 1))

(defun search-closing-parenthesis-backward ()
  (interactive)
  (re-search-backward "[\}\)]" nil t))

(defun jump-to-matching-parenthesis ()
  (interactive)
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

(defun search-semicolon-forward ()
  (interactive)
  (search-forward ";"))

(defun search-semicolon-backward ()
  (interactive)
  (backward-char 1)
  (search-backward ";" nil t)
  (forward-char 1))

(global-set-key [S-M-right] 'search-parenthesis-forward)
(global-set-key [S-M-left] 'search-parenthesis-backward)
(global-set-key (kbd "M-l") 'search-closing-parenthesis-forward)
(global-set-key (kbd "M-p") 'search-closing-parenthesis-backward)
(global-set-key (kbd "M-5") 'jump-to-matching-parenthesis)
(global-set-key (kbd "M-\"") 'search-semicolon-forward)
(global-set-key (kbd "M-:") 'search-semicolon-backward)

;; mark current word
  (defun my-mark-current-word (&optional arg allow-extend)
    "Put point at beginning of current word, set mark at end."
    (interactive "p\np")
    (setq arg (if arg arg 1))
    (if (and allow-extend
             (or (and (eq last-command this-command) (mark t))
                 (region-active-p)))
        (set-mark
         (save-excursion
           (when (< (mark) (point))
             (setq arg (- arg)))
           (goto-char (mark))
           (forward-word arg)
           (point)))
      (let ((wbounds (bounds-of-thing-at-point 'word)))
        (unless (consp wbounds)
          (error "No word at point"))
        (if (>= arg 0)
            (goto-char (car wbounds))
          (goto-char (cdr wbounds)))
        (push-mark (save-excursion
                     (forward-word arg)
                     (point)))
        (activate-mark))))
(global-set-key [M-up] 'my-mark-current-word)

;; select whole line
(defun my-select-current-line-and-forward-line (arg)
  (interactive "p")
  (when (not (use-region-p))
    (forward-line 0)
    (set-mark-command nil))
  (forward-line arg))
(global-set-key [M-down] 'my-select-current-line-and-forward-line)

;; tabbar mode
(require 'tabbar)
(tabbar-mode)
(setq tabbar-use-images nil)

(setq tabbar-buffer-groups-function (lambda () (list "All")))

;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
 (setq ad-return-value
       (if (and (buffer-modified-p (tabbar-tab-value tab))
                (buffer-file-name (tabbar-tab-value tab)))
           (concat " + " (concat ad-return-value " "))
         (concat " " (concat ad-return-value " ")))))

;; Called each time the modification state of the buffer changed.
(defun ztl-modification-state-change ()
 (tabbar-set-template tabbar-current-tabset nil)
 (tabbar-display-update))

;; First-change-hook is called BEFORE the change is made.
(defun ztl-on-buffer-modification ()
 (set-buffer-modified-p t)
 (ztl-modification-state-change))
(add-hook 'after-save-hook 'ztl-modification-state-change)

(add-hook 'first-change-hook 'ztl-on-buffer-modification)

(setq tabbar-background-color "#232323")

(set-face-attribute 'tabbar-unselected nil
        :inherit 'tabbar-default
        :background "#232323"
        :foreground "#969696")

(set-face-attribute 'tabbar-modified nil
        :inherit 'tabbar-unselected
        :foreground "IndianRed4")

(set-face-attribute 'tabbar-selected-modified nil
        :inherit 'tabbar-selected
        :foreground "IndianRed4")

(custom-set-variables
 '(tabbar-buffer-home-button (quote (("") "")))
 '(tabbar-home-button (quote (("") "")))
 '(tabbar-scroll-left-button (quote ((" <") "")))
 '(tabbar-scroll-right-button (quote ((" ") "")))
 )

(defun tabbar-line-format (tabset)
  "Return the `header-line-format' value to display TABSET."
  (let* ((sel (tabbar-selected-tab tabset))
         (tabs (tabbar-view tabset))
         (padcolor (tabbar-background-color))
         atsel elts)
    ;; Initialize buttons and separator values.
    (or tabbar-separator-value
        (tabbar-line-separator))
    (or tabbar-home-button-value
        (tabbar-line-button 'home))
    (or tabbar-scroll-left-button-value
        (tabbar-line-button 'scroll-left))
    (or tabbar-scroll-right-button-value
        (tabbar-line-button 'scroll-right))
    ;; Track the selected tab to ensure it is always visible.
    (when tabbar--track-selected
      (while (not (memq sel tabs))
        (tabbar-scroll tabset -1)
        (setq tabs (tabbar-view tabset)))
      (while (and tabs (not atsel))
        (setq elts  (cons (tabbar-line-tab (car tabs)) elts)
              atsel (eq (car tabs) sel)
              tabs  (cdr tabs)))
      (setq elts (nreverse elts))
      ;; At this point the selected tab is the last elt in ELTS.
      ;; Scroll TABSET and ELTS until the selected tab becomes
      ;; visible.
      (with-temp-buffer
        (let ((truncate-partial-width-windows nil)
              (inhibit-modification-hooks t)
              deactivate-mark ;; Prevent deactivation of the mark!
              start)
          (setq truncate-lines nil
                buffer-undo-list t)
          (apply 'insert (tabbar-line-buttons tabset))
          (setq start (point))
          (while (and (cdr elts) ;; Always show the selected tab!
                      (progn
                        (delete-region start (point-max))
                        (goto-char (point-max))
                        (apply 'insert elts)
                        (goto-char (point-min))
                        (> (vertical-motion 1) 0)))
            (tabbar-scroll tabset 1)
            (setq elts (cdr elts)))))
      (setq elts (nreverse elts))
      (setq tabbar--track-selected nil))
    ;; Format remaining tabs.
    (while tabs
      (setq elts (cons (tabbar-line-tab (car tabs)) elts)
            tabs (cdr tabs)))
    ;; Cache and return the new tab bar.
    (tabbar-set-template
     tabset
     (list (tabbar-line-buttons tabset)
           (nreverse elts)
           (propertize ""
                       'face (list :background padcolor
                                   :foreground padcolor)
                       'pointer 'arrow)))
    ))

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
(global-set-key [C-right] 'next-buffer)
(global-set-key [C-left]  'previous-buffer)

;; kill all buffers except the current
(defun only-current-buffer ()
  (interactive)
  (let ((tobe-killed (cdr (buffer-list (current-buffer)))))
    (while tobe-killed
      (kill-buffer (car tobe-killed))
      (setq tobe-killed (cdr tobe-killed)))
      (redraw-display)))

(global-set-key (kbd "C-x C-k")  'only-current-buffer)

;; kill buffer without asking
(global-set-key (kbd "C-x k") 'kill-this-buffer)

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
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "bower_components"))
 (files ("*.jpg" "*.png" "*.zip" "*~" ".DS_Store" "*.o" "*.d" "*.out"))))

;; Ido
(require 'ido)
(ido-mode t)

;; diff-hl
(require 'diff-hl)

(defvar diff-hl-margin-spec-cache
  (cl-loop for (type . char) in '((insert . " ") (delete . " ")
                                  (change . " ") (unknown . " ")
                                  (ignored . " "))
        nconc
        (cl-loop for side in '(left right)
                 collect
                 (cons (cons type side)
                       (propertize
                        " " 'display
                        `((margin ,(intern (format "%s-margin" side)))
                          ,(propertize char 'face
                                       (intern (format "diff-hl-%s" type)))))))))

(diff-hl-mode)
(diff-hl-margin-mode)
(diff-hl-flydiff-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(set-face-attribute 'diff-hl-insert nil :background "DarkOliveGreen")
(set-face-attribute 'diff-hl-change nil :background "gray34")
(set-face-attribute 'diff-hl-delete nil :background "IndianRed4")

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/indent-line 'auto)

;; emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; auto-complete
(ac-config-default)
(setq-default ac-sources '(ac-source-words-in-buffer))

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c e") 'mc/edit-lines)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)
(global-set-key [S-M-up] 'mc/mark-previous-like-this)
(global-set-key [S-M-down] 'mc/mark-next-like-this)

;; empty lines mode
(global-vim-empty-lines-mode)

;; undo tree
(global-undo-tree-mode)
