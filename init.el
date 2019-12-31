;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       ;; debugger          ; FIXME stepping through code, to help you add bugs
       ;; file-templates    ; auto-snippets for empty files
       ;; +devdocs       ; ...on devdocs.io online
       ;; +docsets)      ; ...or in Dash docsets locally

       :completion
       (company          ; the ultimate code completion
       ;; +tng            ; Enables completion using only ~TAB~.
        +childframe)     ; a nicer company UI. Emacs +26 only!
       ;; (helm          ; the *other* search engine for love and life
       ;; +fuzzy
       ;; +childframe)
       (ivy               ; a search engine for love and life
        +fuzzy
        +childframe)      ; uses childframes for popups (Emacs 26+ only)
       ;; ido              ; the other *other* search engine...

       :ui
       workspaces        ; tab emulation, persistence & separate workspaces
       ;; deft              ; notational velocity for Emacs
       ;; (pretty-code +fira)
       vc-gutter         ; vcs diff in the fringe
       ;; indent-guides
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       modeline          ; a snazzy Atom-inspired mode-line but new
       ;; fci               ; show a fill-column indicator
       ;; doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ophints           ; display visual hints when editing in evil
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       nav-flash         ; blink the current line after jumping
       ;; tabbar            ; FIXME an (incomplete) tab bar for Emacs
       unicode           ; extended unicode support for various languages
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       ;; neotree           ; a project drawer, like NERDTree for vim
       treemacs          ; a project drawer, like neotree but cooler

       :tools
       (pass
         +auth)    ; password manager for nerds
       eval              ; run code, run (also, repls)
       lsp
       ;; ansible
       docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ;; ein               ; tame Jupyter notebooks with emacs
       ;; gist              ; interacting with github gists
       macos             ; MacOS-specific commands
       ;; make              ; run make tasks from Emacs
       magit             ;
       ;; pdf               ; pdf enhancements
       rgb               ; creating color strings
       tmux              ; an API for interacting with tmux
       ;; upload            ; map local to remote projects via ssh/ftp
       flyspell
       flycheck
       lookup           ; helps you navigate your code and documentation

       :emacs
       vc                ; remember, remember that commit in November
       (dired            ; making dired pretty [functional]
        +ranger
        +icons)
       electric          ; smarter, keyword-based electric-indent
       ;; imenu             ; an imenu sidebar and searchable code index
       ;; term              ; terminals in Emacs

       :term
       eshell            ; a consistent, cross-platform shell (WIP)
       ;;term            ; terminals in Emacs
       ;;vterm            ; another terminals in Emacs

       :editor
       snippets          ; my elves. They type so I don't have to
       (evil +everywhere); come to the dark side, we have cookies
       ;; (format +onsave)
       multiple-cursors  ; editing in many places at once
       ;; parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       fold
       ;; lispy             ; vim for lisp, for people who dont like vim

       :lang
       ;; assembly          ; assembly for fun or debugging
       ;; (cc +irony +rtags +lsp)                ; C/C++/Obj-C madness
       ;; crystal           ; ruby at the speed of c
       ;; clojure           ; java with a lisp
       ;; csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       erlang            ; an elegant language for a more civilized age
       ;; elixir            ; erlang done right
       ;; elm               ; care for a cup of TEA?
       common-lisp
       ;; coq               ; proofs-as-programs
       emacs-lisp        ; drown in parentheses
       ess               ; emacs speaks statistics
       (go +lsp)                ; the hipster dialect
       (haskell
        +intero
        +lsp)            ; a language that's lazier than I am
       ;; hy                ; readability of scheme w/ speed of python
       (java +meghanada) ; the poster child for carpal tunnel syndrome
       (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
       ;; julia             ; a better, faster MATLAB
       (latex +latexmk)            ; writing papers in Emacs has never been so fun
       lean
       ;; ledger            ; an accounting system in Emacs
       ;; lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;; nim               ; python + lisp at the speed of c
       ;; nix               ; I hereby declare "nix geht mehr!"
       ;; ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +dragndrop
        +ipython
        +pandoc
        +gnuplot
        +present)
       ;; perl              ; write code no one else can comprehend
       ;; (php +lsp)               ; perl's insecure younger brother
       ;; plantuml          ; diagrams for confusing people more
       ;; purescript        ; javascript, but functional
       (python +lsp)            ; beautiful is better than ugly
       ;; qt                ; the 'cutest' gui framework ever
       racket            ; a DSL for DSLs
       ;; rest              ; Emacs as a REST client
       ;; (ruby +lsp)              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;; scala             ; java, but good
       ;; (sh +zsh)                ; she sells (ba|z)sh shells on the C xor
       ;; solidity          ; do you need a blockchain? No.
       ;; swift             ; who asked for emoji variables?
       (web +lsp)               ; the tubes

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       ;; calendar
       ;; regex
       ;; email              ; emacs as an email client
       ;; irc               ; how neckbeards socialize
       ;; (rss +org)        ; emacs as an RSS reader
       ;; twitter           ; twitter client https://twitter.com/vnought
       ;; (write            ; emacs as a word processor (latex + org + markdown)
       ;; +wordnut         ; wordnet (wn) search
       ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
       ;; floobits          ; peer programming for a price
       ;; impatient-mode    ; show off code over HTTP
       ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :config
       ;; The default module set reasonable defaults for Emacs. It also provides
       ;; a Spacemacs-inspired keybinding scheme, a custom yasnippet library,
       ;; and additional ex commands for evil-mode. Use it as a reference for
       ;; your own modules.
       (default +smartparens +snippets +bindings))
