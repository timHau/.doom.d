;;; ~/.doom.d/+tools.el -*- lexical-binding: t; -*-

(after! company
  (setq company-idle-delay 0.3
        company-auto-complete-chars nil
        company-minimum-prefix-length 2))

;; sage math
(use-package sage-shell-mode
  :config (sage-shell:define-alias))

;; wttrin
(after! wttrin
  :init (setq wttrin-default-cities '("Frankfurt")
              wttrin-default-accept-language '("Accept-Language" . "de-DE,de;q=0.9,en;q=0.8,en-US;q=0.7,fr;q=0.6")))

(after! helm
  :config (setq +helm-global-prompt "➜  "))

;; smartparens
(setq sp-autowrap-region t
      sp-max-pair-length 2)

;; (after! ivy-posframe
;; (setq ivy-display-function #'ivy-posframe-display-at-point))

(after! epa
  (setq epa-file-encrypt-to (or epa-file-encrypt-to user-mail-address)
        ;; With GPG 2.1, this forces gpg-agent to use the Emacs minibuffer to
        ;; prompt for the key passphrase.
        epa-pinentry-mode 'loopback))
