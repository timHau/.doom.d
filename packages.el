;; -*- no-byte-compile: t; -*-
;;; private/default/packages.el

(package! emacs-snippets
  :recipe (:fetcher github
           :repo "hlissner/emacs-snippets"
           :files ("*")))

;; (package! sage-shell-mode
  ;; :recipe (:fetcher github
          ;; :repo "sagemath/sage-shell-mode"))
