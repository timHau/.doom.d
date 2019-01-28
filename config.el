;;; private/default/config.el -*- lexical-binding: t; -*-

(load! "./+bindings")
(load! "./+ui")
;; (load! "./+mail")
(load! "./+tools")

(load! "./lang/web")

;;
;; Config
;;

(setq-default mac-right-option-modifier nil)
(setq mac-right-command-modifier 'control
      mac-command-modifier 'meta
      mac-option-modifier 'alt
      x-select-enable-clipboard t
      ns-function-modifier 'super
      shift-select-mode t)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
