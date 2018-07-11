;;; +ui.el --- description -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq
 doom-font (font-spec :family "Fira Code" :size 9)
 +doom-modeline-height 22)

;; fancy symbols
(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ)))

(let ((alist '(
               (33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))

 (dolist (char-regexp alist)
   (set-char-table-range composition-function-table (car char-regexp)
                         `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; customize popups
;; TODO should be set-popup-rules
(set-popup-rule! "\\*Customize" :side 'right :width 0.4 :quit nil)
(set-popup-rule! "Sage\\*$" :quit nil)
(set-popup-rule! "\\*haskell\\*" :quit nil)
(set-popup-rule! "\\*intero" :quit nil)
(set-popup-rule! "\\*mu4e" :side 'right :width 0.5)
(set-popup-rule! "\\*eshell" :quit nil)

;; change color of cursor
(setq evil-normal-state-cursor '("yellow1" . 'box)
      evil-insert-state-cursor '("#00ff00" . 'bar))

(after! neotree
  (setq neo-window-width 30
        show-hidden-files t))

(after! highlight-indentation-mode
  (set-face-background 'highlight-indentation-face "#e3e3d3"))
