;;; ~/.doom.d/+tools.el -*- lexical-binding: t; -*-

;; sage math
(def-package! sage-shell-mode
  :config (sage-shell:define-alias))

;; smartparens
(after! smartparens
  (setq sp-autowrap-region t
        sp-max-pair-length 2))

(def-package! emacs-snippets :after yasnippet)

(after! epa
  (setq epa-file-encrypt-to (or epa-file-encrypt-to user-mail-address)
        ;; With GPG 2.1, this forces gpg-agent to use the Emacs minibuffer to
        ;; prompt for the key passphrase.
        epa-pinentry-mode 'loopback))

;; eshell
(after! eshell
  (set-eshell-alias!
   "q"   "quit-and-close"
   "l"   "ls -l"
   "la"  "ls -la"
   "f"   "find-file $1"
   "d"   "dired $1"
   "gl"  "(call-interactively 'magit-log-current)"
   "gs"  "magit-status"
   "gc"  "magit-commit"
   "ag"  "ag --color=always $*"))

(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     ;; (shell . t)
     ;; (ruby . t)
     ;; (clojure . t)
     (js . t)
     (sql . t)
     (haskell . t)))

  (setq org-confirm-babel-evaluate nil))

(after! lsp
  (setq lsp-ui-doc-max-height 15
        lsp-ui-doc-max-width 50))
