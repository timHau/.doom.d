;;; +ui.el --- description -*- lexical-binding: t; -*-

(load! "./themes/mono-theme")

(setq
 doom-font (font-spec :family "Fira Code" :size 9)
  doom-theme 'mono
 doom-line-numbers-style nil
 +modeline-width 4
 +modeline-height 15)

;; (after! helm-mode
  ;; (setq +helm-posframe-text-scale -1
        ;; ))

;; without childframe
(after! helm-mode
  (setq +helm-global-prompt "➜  "
        helm-display-buffer-default-height 0.2))

(let ((alist '(
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
(set-popup-rules!
  '(("\\*eshell" :quit nil)
    ("\\*intero" :quit nil)
    ("\\*haskell\\*" :quit nil)
    ("Sage\\*$" :quit nil)
    ("\\*Customize" :side right :quit nil :width 0.4)))

;; change color of cursor
(setq evil-normal-state-cursor '("DeepSkyBlue1" . 'box)
      evil-insert-state-cursor '("#00ff00" . 'bar))

(after! highlight-indentation-mode
  (set-face-background 'highlight-indentation-face "#e3e3d3"))
