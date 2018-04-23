;;; private/default/config.el -*- lexical-binding: t; -*-

(load! +bindings)


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

(setq doom-font (font-spec :family "Fira Code" :size 9))

(after! evil-commands
  (define-key evil-insert-state-map (kbd "C-t") 'transpose-chars))

(when (featurep 'evil)
  (load! +evil-commands)

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
  (require 'company)
  (setq company-idle-delay 0.2)

  (require 'helm-ag)

  ;; fancy symbols
  (defconst lisp--prettify-symbols-alist
    '(("lambda"  . ?λ)))

  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                 )
               ))

    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring]))))


  ;; mail

  (require 'smtpmail)
  (set! :email "tim.hau@hotmail.de"
    '((mu4e-sent-folder       . "/hotmail/Sent")
      (mu4e-drafts-folder     . "/hotmail/Drafts")
      (mu4e-trash-folder      . "/hotmail/Deleted")
      (mu4e-refile-folder     . "/hotmail/Inbox")
      (smtpmail-smtp-user     . "tim.hau@hotmail.de")
      (user-mail-address      . "tim.hau@hotmail.de")
      (user-full-name         . "tim hau")
      (mu4e-compose-signature . "")
      (smtpmail-smtp-server   . "smtp-mail.outlook.com")
      (smtpmail-smtp-user     . "tim.hau@hotmail.de")
      (smtpmail-smtp-service  . 587))
    t)

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
