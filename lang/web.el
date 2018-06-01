;;; ~/.doom.d/lang/js.el -*- lexical-binding: t; -*-

(after! js2-mode
  ;; no semicolon warnings in js mode
  (setq js2-strict-missing-semi-warning nil
        js2-missing-semi-one-line-override nil)
  (setq-default web-mode-indent-style 2
                line-spacing 2
                js-indent-level 2))

(after! css
  (setq css-indent-offset 2
        flycheck-disabled-checkers '(scss-stylelint sass/scss-sass-lint scss-lint scss)))

