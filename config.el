;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "tim hau"
      user-mail-address "tim.hau@hotmail.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 11))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-palenight)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; cursor style
(setq evil-normal-state-cursor '("DeepSkyBlue1" . 'box)
      evil-insert-state-cursor '("#00ff00" . 'bar))

;; modeline
(setq doom-modeline-height 16)


;; bindings
;;
;; customize control / meta / alt
(setq-default mac-right-option-modifier nil)
(setq mac-right-command-modifier 'control
      mac-command-modifier 'meta
      mac-option-modifier 'alt
      x-select-enable-clipboard t
      ns-function-modifier 'super
      shift-select-mode t)

;; smoother scrolling
(map!

 ;; workspaces / buffers / windows / files
 "M-t"         #'+workspace/new
 "M-w"         #'delete-window
 "M-n"         #'evil-buffer-new
 "M-ä"         #'shrink-window
 "M-ü"         #'enlarge-window
 "M-s"         #'save-buffer
 "M-r"         #'eval-buffer
 "M-a"         #'mark-whole-buffer
 "A-r"         #'counsel-recentf

 ;; text bindings
 "M-+"         #'text-scale-increase
 "M-="         (lambda! (text-scale-set 0))
 "M--"         #'text-scale-decrease
 "M-c"         #'evil-yank
 "M-v"         #'clipboard-yank
 "C-,"         #'comment-line
 "A-t"         #'transpose-words
 "M-z"         #'undo-tree-undo
 "M-Z"         #'undo-tree-redo
 :i "C-t"      #'transpose-chars
 "M-RET"       (lambda! (evil-open-below 0))
 "A-d"         #'kill-word
 :i "C-d"      #'delete-char
 "A-<backspace>" #'backward-kill-word
 :i "C-k"    #'widget-kill-line


 ;; navigation
 :n "A-i"      #'evil-scroll-line-up
 :n "A-o"      #'evil-scroll-line-down
 "A-l"         #'forward-word
 "A-h"         #'backward-word
 :en "C-h"     #'evil-window-left
 :en "C-j"     #'evil-window-down
 :en "C-k"     #'evil-window-up
 :en "C-l"     #'evil-window-right
 :m  "A-j"     #'multi-next-line
 :m  "A-k"     #'multi-previous-line


 ;; searching
 :ne "M-p"     #'counsel-ag
 :ne "M-f"     #'swiper

 ;; leader <==> space
 (:leader
   :desc "kill-ring"                   :nv "y"  #'counsel-yank-pop

   (:desc "jump" :prefix "j"
     :desc "definiton"                 :nv "d" #'+lookup/definition
     :desc "jump"                      :nv "j" #'dumb-jump-go
     :desc "word"                      :nv "w" #'avy-goto-word-1
     :desc "Jump to definition"        :n  "d" #'+lookup/definition
     :desc "Jump to references"        :n  "r" #'+lookup/references
     :desc "line"                      :nv "l" #'avy-goto-line)
   )

 ;; expand-region
 :v  "v"  #'er/expand-region
 :v  "V"  #'er/contract-region

 ;; ivy
 (:after counsel
   :map counsel-find-file-map
   [left]   #'ivy-backward-delete-char
   [right]  #'ivy-alt-done)


 )


;; ivy config
(after! ivy
  (setq counsel-yank-pop-separator "

____________________________________________

"))


;; set size when starting doom
(add-to-list 'default-frame-alist (cons 'width 275))
(add-to-list 'default-frame-alist (cons 'height 250))
