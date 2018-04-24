;; -*- no-byte-compile: t; -*-
;;; private/default/packages.el

(package! emacs-snippets
  :recipe (:fetcher github
           :repo "hlissner/emacs-snippets"
           :files ("*")))

(package! auth-source-pass
  :recipe (:fetcher github
           :repo "DamienCassou/auth-password-store"))

(package! helm-pass
  :recipe (:fetcher github
           :repo "jabranham/helm-pass"))

(package! sage-shell-mode
  :recipe (:fetcher github
           :repo "sagemath/sage-shell-mode"))
