;;; ~/.doom.d/+macos.el -*- lexical-binding: t; -*-

(setq-default mac-right-option-modifier nil)
(setq mac-right-command-modifier 'control
      x-select-enable-clipboard t
      ns-function-modifier 'super
      shift-select-mode t)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
