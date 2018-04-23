;;; private/main/init.el -*- lexical-binding: t; -*-

(eval-when-compile
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
  (require 'use-package))
(use-package mu4e)
