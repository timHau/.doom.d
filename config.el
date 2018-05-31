;;; private/default/config.el -*- lexical-binding: t; -*-

(load! "./+bindings")
(load! "./+ui")
(load! "./+mail")


;;
;; Plugins
;;

(def-package! emacs-snippets :after yasnippet)

;;
;; Config
;;

(after! epa
  (setq epa-file-encrypt-to (or epa-file-encrypt-to user-mail-address)
        ;; With GPG 2.1, this forces gpg-agent to use the Emacs minibuffer to
        ;; prompt for the key passphrase.
        epa-pinentry-mode 'loopback))


(after! highlight-indentation-mode
  (set-face-background 'highlight-indentation-face "#e3e3d3"))

(setq flycheck-disabled-checkers '(scss-stylelint sass/scss-sass-lint scss-lint scss))

(setq x-select-enable-clipboard t)

(setq shift-select-mode t)

(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (doom*newline-and-indent 3)
    (previous-line)))

(after! evil-commands
  (define-key evil-insert-state-map (kbd "C-o") 'newline-without-break-of-line))

(when (featurep 'evil)
  (load! "./+evil-commands")

  ;; Makes ; and , the universal repeat-keys in evil-mode
  (defmacro do-repeat! (command next-func prev-func)
    "Repeat motions with ;/,"
    (let ((fn-sym (intern (format "+evil*repeat-%s" command))))
      `(progn
         (defun ,fn-sym (&rest _)
           (define-key evil-motion-state-map (kbd ";") ',next-func)
           (define-key evil-motion-state-map (kbd ",") ',prev-func))
         (advice-add #',command :before #',fn-sym))))

  ;; n/N
  (do-repeat! evil-ex-search-next evil-ex-search-next evil-ex-search-previous)
  (do-repeat! evil-ex-search-previous evil-ex-search-next evil-ex-search-previous)
  (do-repeat! evil-ex-search-forward evil-ex-search-next evil-ex-search-previous)
  (do-repeat! evil-ex-search-backward evil-ex-search-next evil-ex-search-previous)

  ;; f/F/t/T/s/S
  (after! evil-snipe
    (setq evil-snipe-repeat-keys nil
          evil-snipe-override-evil-repeat-keys nil) ; causes problems with remapped ;

    (do-repeat! evil-snipe-f evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-F evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-t evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-T evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-s evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-S evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-x evil-snipe-repeat evil-snipe-repeat-reverse)
    (do-repeat! evil-snipe-X evil-snipe-repeat evil-snipe-repeat-reverse))

  ;; */#
  (after! evil-visualstar
    (do-repeat! evil-visualstar/begin-search-forward
                evil-ex-search-next evil-ex-search-previous)
    (do-repeat! evil-visualstar/begin-search-backward
                evil-ex-search-previous evil-ex-search-next))

  ;; no semicolon warnings in js mode
  (setq js2-strict-missing-semi-warning nil
        js2-missing-semi-one-line-override nil)
  (setq-default web-mode-indent-style 2)
  (setq-default line-spacing 2)
  (setq-default js-indent-level 2)

  (setq-default mac-right-option-modifier nil)
  (setq mac-right-command-modifier 'control)

  (after! company
    (setq company-idle-delay 0.3
          company-auto-complete-chars nil
          company-minimum-prefix-length 2))

  (after! css
    (setq css-indent-offset 2))

  ;; sage math
  (use-package sage-shell-mode
    :config (sage-shell:define-alias))

  ;; wttrin
  (after! wttrin
    :init (setq wttrin-default-cities '("Frankfurt")
                wttrin-default-accept-language '("Accept-Language" . "de-DE,de;q=0.9,en;q=0.8,en-US;q=0.7,fr;q=0.6")))

  ;; smartparens
  (setq sp-autowrap-region t
        sp-max-pair-length 2)

  (after! haskell-mode
    (setq highlight-indentation-mode nil))

  ;; (after! ivy-posframe
    ;; (setq ivy-display-function #'ivy-posframe-display-at-point))

  (after! evil-easymotion
    (let ((prefix (concat doom-leader-key " /")))
      ;; NOTE `evilem-default-keybinds' unsets all other keys on the prefix (in
      ;; motion state)
      (evilem-default-keybindings prefix)
      (evilem-define (kbd (concat prefix " n")) #'evil-ex-search-next)
      (evilem-define (kbd (concat prefix " N")) #'evil-ex-search-previous)
      (evilem-define (kbd (concat prefix " s")) #'evil-snipe-repeat
                     :pre-hook (save-excursion (call-interactively #'evil-snipe-s))
                     :bind ((evil-snipe-scope 'buffer)
                            (evil-snipe-enable-highlight)
                            (evil-snipe-enable-incremental-highlight)))
      (evilem-define (kbd (concat prefix " S")) #'evil-snipe-repeat-reverse
                     :pre-hook (save-excursion (call-interactively #'evil-snipe-s))
                     :bind ((evil-snipe-scope 'buffer)
                            (evil-snipe-enable-highlight)
                            (evil-snipe-enable-incremental-highlight))))))

