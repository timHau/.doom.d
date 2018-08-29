;;; +ui.el --- description -*- lexical-binding: t; -*-

(load! "./themes/mono-theme")

(setq
 ;; doom-font (font-spec :family "Fira Code" :size 9)
 doom-font (font-spec :family "Source Code Pro" :size 9)
 doom-theme 'mono
 evil-normal-state-cursor '("DeepSkyBlue1" . 'box)
 evil-insert-state-cursor '("#00ff00" . 'bar)
 +modeline-width 4
 +modeline-height 15
 display-line-numbers-type nil)


;; without childframe
(after! helm-mode
  (setq +helm-global-prompt "➜  "
        helm-display-buffer-default-height 0.2))

(set-popup-rules!
  '(("\\*eshell" :quit nil)
    ("\\*intero" :quit nil)
    ("\\*haskell\\*" :quit nil)
    ("Sage\\*$" :quit nil)
    ("^\\*Customize" :side right :quit nil :size 0.3 :select t))

  ;; (let ((alist '(
  ;;                (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
  ;;                (36 . ".\\(?:>\\)")
  ;;                (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
  ;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
  ;;                (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
  ;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
  ;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
  ;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
  ;;                (58 . ".\\(?:::\\|[:=]\\)")
  ;;                (59 . ".\\(?:;;\\|;\\)")
  ;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
  ;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
  ;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
  ;;                (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
  ;;                (91 . ".\\(?:]\\)")
  ;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
  ;;                (94 . ".\\(?:=\\)")
  ;;                (119 . ".\\(?:ww\\)")
  ;;                (123 . ".\\(?:-\\)")
  ;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
  ;;                (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
  ;;                )
  ;;              ))

  ;;   (dolist (char-regexp alist)
  ;;     (set-char-table-range composition-function-table (car char-regexp)
  ;;                           `([,(cdr char-regexp) 0 font-shape-gstring]))))
  )


(after! ivy-posframe
  (setq ivy-fixed-height-minibuffer nil
                                        ;        ivy-display-function #'ivy-posframe-display-at-lower-center
        ivy-posframe-parameters
        `((min-width . 150)
          (min-height . 17)
          (internal-border-width . 5))))

(after! highlight-indentation-mode
  (set-face-background 'highlight-indentation-face "#e3e3d3"))
