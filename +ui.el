;;; +ui.el --- description -*- lexical-binding: t; -*-

;; (load! "./themes/mono-theme")
(load! "./themes/blue-theme")

(setq
 doom-font (font-spec :family "Source Code Pro" :size 10)
 doom-theme 'mono
 evil-normal-state-cursor '("DeepSkyBlue1" . 'box)
 evil-insert-state-cursor '("#00ff00" . 'bar)
 +modeline-width 4
 +modeline-height 16
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
    ("^\\*Customize" :side right :quit nil :size 0.4 :select t)))


(after! ivy-posframe
  (setq ivy-fixed-height-minibuffer nil
        ; ivy-display-function #'ivy-posframe-display-at-lower-center
        ivy-posframe-parameters
        `((min-width . 130)
          (min-height . 17)
          (internal-border-width . 5))))

(after! highlight-indentation-mode
  (set-face-background 'highlight-indentation-face "#e3e3d3"))

(after! ivy
  (setq counsel-yank-pop-separator "

____________________________________________

"))
