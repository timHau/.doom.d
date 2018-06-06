;;; ~/.doom.d/lang/commonlisp.el -*- lexical-binding: t; -*-

(after! slime
  (map! (:map slime-mode-map
          (:prefix "e"
            :n "b"     #'slime-eval-buffer
            :n "f"     #'slime-eval-last-expression))))
