;;; +mail.el --- description -*- lexical-binding: t; -*-

(require 'smtpmail)

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

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
 (use-package mu4e
   :config (setq mu4e-get-mail-command "offlineimap"))


(provide '+mail)
