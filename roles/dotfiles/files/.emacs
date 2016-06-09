;; Emacs will be slow to start unless you have a fully-qualified domain name for
;; the computer's hostname, for example:
;; sudo scutil --set HostName gaspar.local

(require 'package)

;; list the packages you want
(setq package-list '(zenburn-theme fiplr whitespace tabbar diff-hl
  yasnippet emmet-mode auto-complete multiple-cursors))

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

;; automatically insert closing braces
(electric-pair-mode 1)

;; show end of buffer
(defun my-mark-eob ()
  (let ((existing-overlays (overlays-in (point-max) (point-max)))
        (eob-mark (make-overlay (point-max) (point-max) nil t t))
        (eob-text "~"))
    ;; Delete any previous EOB markers.  Necessary so that they don't
    ;; accumulate on calls to revert-buffer.
    (dolist (next-overlay existing-overlays)
      (if (overlay-get next-overlay 'eob-overlay)
          (delete-overlay next-overlay)))
    ;; Add a new EOB marker.
    (put-text-property 0 (length eob-text)
          'face '(foreground-color . "slate gray") eob-text)
    (overlay-put eob-mark 'eob-overlay t)
    (overlay-put eob-mark 'after-string eob-text)))
 (add-hook 'find-file-hooks 'my-mark-eob)

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
(global-set-key (kbd "ESC <up>") 'my-mark-current-word)

;; select whole line
(defun my-select-current-line-and-forward-line (arg)
  (interactive "p")
  (when (not (use-region-p))
    (forward-line 0)
    (set-mark-command nil))
  (forward-line arg))
(global-set-key (kbd "ESC <down>") 'my-select-current-line-and-forward-line)

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

;; This doesn't work for revert, I don't know.
;;(add-hook 'after-revert-hook 'ztl-modification-state-change)
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
(global-set-key (kbd "M-[ c")  'next-buffer)
(global-set-key (kbd "M-[ d")  'previous-buffer)

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
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
 (files ("*.jpg" "*.png" "*.zip" "*~" ".DS_Store"))))

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

;; (setq diff-hl-side 'right)

(set-face-attribute 'diff-hl-insert nil :background "DarkOliveGreen")
(set-face-attribute 'diff-hl-change nil :background "gray34")
(set-face-attribute 'diff-hl-delete nil :background "IndianRed4")

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; auto-complete
(ac-config-default)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c e") 'mc/edit-lines)
(global-set-key (kbd "M-[ a") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-[ b") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

