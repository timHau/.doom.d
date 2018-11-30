;;; ~/.doom.d/+tools.el -*- lexical-binding: t; -*-

(after! company
  (setq
   company-idle-delay 0.1
   company-auto-complete-chars nil
   company-show-numbers t
   company-tooltip-minimum-width 50
   ;; company-tooltip-minimum-height 60
   company-tooltip-limit 15
   company-minimum-prefix-length 3))

;; sage math
(def-package! sage-shell-mode
  :config (sage-shell:define-alias))

;; wttrin
(after! wttrin
  :init (setq wttrin-default-cities '("Frankfurt am Main")
              wttrin-default-accept-language '("Accept-Language" . "de-DE,de;q=0.9,en;q=0.8,en-US;q=0.7,fr;q=0.6")))

(after! latex
  (setq +latex-enable-unicode-math t))


;; inf-mongo
(def-package! inf-mongo)

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

;; https://github.com/atykhonov/google-translate/issues/52#issuecomment-423870290
(def-package! google-translate
  :config
  (defun google-translate--get-b-d1 ()
    ;; TKK='427110.1469889687'
    (list 427110 1469889687)))

;; (use-package fogbugz
;;   :init (setq fogbugz-url "nest.meso.net")
;;   :load-path "~/Desktop/tts/fogbugz")
