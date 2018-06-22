;;; ~/.doom.d/lang/racket.el -*- lexical-binding: t; -*-


(def-package! geiser
  :config
  (add-hook! 'geiser-mode-hook #'rainbow-delimiters-mode)
  (doc-view-minor-mode -1))
