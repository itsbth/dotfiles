;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     vimscript
     nginx
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     better-defaults
     chrome
     ;; colors
     (colors :variables
               colors-enable-nyan-cat-progress-bar t)
     docker
     emoji
     git
     github
     ibuffer
     markdown
     (org :variables
          org-enable-github-support t)
     ranger
     restclient
     selectric
     semantic
     shell
     smex
     spotify
     syntax-checking
     themes-megapack
     tmux
     vagrant
     version-control

     ;; Languages
     ansible
     (c-c++ :variables
            c-c++-enable-clang-support t)
     clojure
     csharp
     django
     emacs-lisp
     elixir
     elm
     erlang
     fsharp
     go
     ;; groovy
     (haskell :variables
              haskell-enable-ghc-mod-support t
              ;; haskell-enable-ghci-ng-support t
              haskell-enable-shm-support t)
     html
     javascript
     lua
     markdown
     nim
     ocaml
     ;; php
     python
     racket
     react
     ruby
     ruby-on-rails
     rust
     scala
     shell-scripts
     sql
     terraform
     typescript
     yaml

     extra-langs

     ;; Private packages
     ;; elm
     parinfer
     )
   ;; A list of additional packages.
   dotspacemacs-additional-packages '(editorconfig ponylang-mode groovy-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
   ;; dotspacemacs-excluded-packages '(php-extras)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'random
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-eighties
                         monokai
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 86
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 86
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  ;; (set-face-attribute 'default nil :font "Source Code Pro Medium-13")
  ;; (autoload 'haskell-indentation-enable-show-indentations "haskell-indentation")
  ;; (autoload 'haskell-indentation-disable-show-indentations "haskell-indentation")
  )

(defun dotspacemacs/user-init ()
  (setq-default rust-enable-racer t)
  ;; (spacemacs/toggle-transparency)
  (defun on-frame-open (&optional frame)
    "If the FRAME created in terminal don't load background color."
    (unless (display-graphic-p frame)
      (set-face-background 'default "unspecified-bg" frame)))

  (add-hook 'after-make-frame-functions 'on-frame-open)
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq powerline-default-separator 'arrow-fade)
  (setq clojure-enable-fancify-symbols t))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#515151" t)
 '(package-selected-packages
   (quote
    (concurrent deferred haml-mode vimrc-mode dactyl-mode autothemer tern markdown-mode bind-key bind-map parinfer perl6-mode powerline rake scala-mode hydra seq spinner company-quickhelp request skewer-mode pcre2el typescript-mode highlight company csharp-mode iedit git-gutter gh auto-complete ob-elixir org minitest insert-shebang hide-comnt go-guru docker-tramp rust-mode inflections multiple-cursors anzu elixir-mode ht inf-ruby dash groovy-mode pug-mode go-mode cider anaconda-mode sbt-mode smartparens undo-tree haskell-mode yasnippet magit-popup git-commit with-editor async hcl-mode clojure-mode helm helm-core flycheck magit projectile js2-mode terraform-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler wolfram-mode window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe vagrant-tramp vagrant uuidgen utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toxi-theme toml-mode toc-org tide thrift tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance stekene-theme stan-mode srefactor sql-indent spotify spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode shell-pop seti-theme selectric-mode scss-mode scad-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restclient restart-emacs rbenv ranger rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racket-mode racer quelpa qml-mode pyvenv pytest pyenv-mode py-isort purple-haze-theme projectile-rails professional-theme popwin ponylang-mode pony-mode planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox ox-gfm orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme omnisharp oldlace-theme ocp-indent occidental-theme obsidian-theme ob-http noflet noctilux-theme nim-mode niflheim-theme nginx-mode neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin matlab-mode material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode julia-mode js2-refactor js-doc jinja2-mode jbeans-theme jazz-theme jade-mode ir-black-theme intero inkpot-theme info+ indent-guide ido-vertical-mode ibuffer-projectile hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-spotify helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-eldoc gnuplot gmail-message-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md gandalf-theme fsharp-mode flycheck-rust flycheck-pos-tip flycheck-nim flycheck-mix flycheck-haskell flycheck-elm flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help erlang ensime emoji-cheat-sheet-plus emmet-mode elm-mode elisp-slime-nav editorconfig edit-server dumb-jump dracula-theme dockerfile-mode docker django-theme disaster diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-shell company-go company-ghci company-ghc company-emoji company-cabal company-c-headers company-anaconda column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode cmm-mode cmake-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby cherry-blossom-theme cargo busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile arduino-mode apropospriate-theme anti-zenburn-theme ansible-doc ansible ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
