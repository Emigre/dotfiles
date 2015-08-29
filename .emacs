; Emacs will be slow to start unless you have a fully-qualified domain name for
; the computer's hostname, for example:
; sudo scutil --set HostName gaspar.local
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
