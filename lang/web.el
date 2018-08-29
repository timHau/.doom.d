;;; ~/.doom.d/lang/web.el -*- lexical-binding: t; -*-

(after! js2-mode
  ;; no semicolon warnings in js mode
  (setq js2-strict-missing-semi-warning nil
        js2-missing-semi-one-line-override nil)
  (setq-default web-mode-indent-style 2
                line-spacing 2
                js-indent-level 2
                flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint))))
