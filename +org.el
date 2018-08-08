;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(after! org
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   ;; (shell . t)
   ;; (ruby . t)
   ;; (clojure . t)
   (js . t)
   (sql . t)
   (haskell . t)))

(setq org-confirm-babel-evaluate nil))

