;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services gnupg)
  #:use-module (gnu home services ssh)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services sound)
  #:use-module (gnu services)
  #:use-module (gnu services security-token)
  #:use-module (gnu packages)
  #:use-module (gnu packages polkit)
  #:use-module (gnu system shadow))

(define home-config
  (home-environment
   (packages (specifications->packages
              (list
               "plasma-browser-integration"
               "sshfs"
               "kdeconnect"
               "v4l2loopback-linux-module"
               "mpv"
               "pulseaudio"
               ;; Terminal emulators.
               "rxvt-unicode" "kitty"
               ;; Shell utilities.
               "ncurses" "tree" "unzip"
               ;; Desktop environment.
               "stumpwm" "cl-stumpwm" "stumpish"
               "sbcl-stumpwm-ttf-fonts"
               "sbcl-stumpwm-binwarp"
               "sbcl-stumpwm-screenshot"
               "sbcl-stumpwm-pass"
               "sbcl-stumpwm-notify"
               ;;"sbcl-stumpwm-rofi"
               "sbcl-stumpwm-wpctl"
               "sbcl-stumpwm-pamixer"
               "sbcl-stumpwm-battery-portable"
               "sbcl-stumpwm-hostname"
               "sbcl-stumpwm-stumptray"
               "sbcl-stumpwm-net"
               "sbcl-stumpwm-wifi"
               "sbcl-stumpwm-mem"
               "sbcl-stumpwm-cpu"
               "sbcl-stumpwm-disk"
               ;; Remote desktop.
               "tigervnc-server" "tigervnc-client"
               ;; Desktop utilities.
               "pavucontrol" "flatpak" "electron" "xrandr"
               ;; Authentication.
               "ccid" "pinentry" "passff-host" "password-store" "gnupg"
               ;; Communication.
               "gajim"
               ;; Browsers.
               "firefox"
               ;; Programming languages, compilers, interpreters, and development tools.
               "clang" "llvm" "gcc-toolchain" "bash" "git" "diffoscope" "difftastic"
               ;; Emacs.
               "emacs" "emacs-evil-org" "emacs-evil-surround" "emacs-evil-numbers" "emacs-highlight-indent-guides" "emacs-flymake-languagetool" "emacs-flymake" "emacs-keyfreq@1" "emacs-rfc-mode" "emacs-osm" "emacs-lorem-ipsum" "emacs-minimap" "emacs-treemacs-extra" "emacs-treemacs" "emacs-projectile" "emacs-editorconfig" "emacs-dired-preview" "emacs-dired-git-info" "emacs-dired-du" "emacs-nix-ts-mode" "emacs-nginx-mode" "emacs-apache-mode" "emacs-auctex" "emacs-biblio" "emacs-emms" "emacs-gdscript-mode" "emacs-irony-eldoc" "emacs-irony-mode-server" "emacs-irony-mode" "emacs-php-mode" "emacs-sed-mode" "emacs-ess" "emacs-csv-mode" "emacs-jinja2-mode" "emacs-web-mode" "emacs-haskell-mode" "emacs-markdown-mode" "emacs-rainbow-mode" "emacs-scad-mode" "emacs-graphviz-dot-mode" "emacs-gnuplot" "emacs-elf-mode" "emacs-nhexl-mode" "emacs-platformio-mode" "emacs-arduino-mode" "emacs-which-key" "emacs-eglot" "emacs-slime" "emacs-evil-cleverparens" "emacs-smartparens" "emacs-sr-speedbar" "emacs-dape" "emacs-jsonrpc" "emacs-hl-todo" "emacs-diff-hl" "emacs-git-modes" "emacs-magit-lfs" "emacs-magit-annex" "emacs-forge" "emacs-magit" "emacs-transient" "emacs-pinentry" "emacs-htmlize" "emacs-org-modern" "emacs-orgit-forge" "emacs-orgit" "emacs-org-web-tools" "emacs-org-roam-ui" "emacs-citar-org-roam" "emacs-org-roam" "emacs-emacsql" "emacs-citar" "emacs-org" "emacs-dashboard" "emacs-nov" "emacs-adaptive-wrap" "emacs-devdocs" "emacs-eldoc" "emacs-eldoc-box" "emacs-capf-autosuggest" "emacs-pcmpl-args" "emacs-company" "emacs-swiper" "emacs-counsel" "emacs-ivy-hydra" "emacs-ivy" "emacs-flx" "emacs-nerd-icons" "emacs-evil-collection" "emacs-evil" "emacs-telephone-line" "emacs-modus-themes" "emacs-compat" "emacs-use-package" "emacs-goto-chg" "emacs-geiser-guile" "emacs-geiser" "emacs-guix" "tree-sitter-zig"
               ;; Tree-sitter.
               "tree-sitter" "tree-sitter-yuck" "tree-sitter-yaml" "tree-sitter-xml" "tree-sitter-xcompose" "tree-sitter-wgsl" "tree-sitter-wast" "tree-sitter-vue" "tree-sitter-vimdoc" "tree-sitter-vim" "tree-sitter-vhdl" "tree-sitter-verilog" "tree-sitter-v" "tree-sitter-uxntal" "tree-sitter-ungrammar" "tree-sitter-udev" "tree-sitter-typst" "tree-sitter-typescript" "tree-sitter-twig" "tree-sitter-toml" "tree-sitter-tlaplus" "tree-sitter-thrift" "tree-sitter-test" "tree-sitter-tcl" "tree-sitter-tablegen" "tree-sitter-systemverilog" "tree-sitter-swift" "tree-sitter-sway" "tree-sitter-svelte" "tree-sitter-starlark" "tree-sitter-squirrel" "tree-sitter-sql" "tree-sitter-sparql" "tree-sitter-solidity" "tree-sitter-smithy" "tree-sitter-smali" "tree-sitter-sfapex" "tree-sitter-scss" "tree-sitter-scheme" "tree-sitter-scala" "tree-sitter-rust" "tree-sitter-ruby" "tree-sitter-rst" "tree-sitter-ron" "tree-sitter-rego" "tree-sitter-readline" "tree-sitter-re2c" "tree-sitter-racket" "tree-sitter-r" "tree-sitter-query" "tree-sitter-qmljs" "tree-sitter-qmldir" "tree-sitter-qml" "tree-sitter-python-requirements" "tree-sitter-python-manifest" "tree-sitter-python" "tree-sitter-purescript" "tree-sitter-puppet" "tree-sitter-proto" "tree-sitter-prisma" "tree-sitter-printf" "tree-sitter-powershell" "tree-sitter-pony" "tree-sitter-po" "tree-sitter-plantuml" "tree-sitter-phpdoc" "tree-sitter-php" "tree-sitter-pgn" "tree-sitter-perl" "tree-sitter-pem" "tree-sitter-pascal" "tree-sitter-org" "tree-sitter-odin" "tree-sitter-ocaml" "tree-sitter-objc" "tree-sitter-nqc" "tree-sitter-nix" "tree-sitter-ninja" "tree-sitter-nim" "tree-sitter-netlinx" "tree-sitter-meson" "tree-sitter-mermaid" "tree-sitter-matlab" "tree-sitter-markdown" "tree-sitter-make" "tree-sitter-magik" "tree-sitter-luau" "tree-sitter-luadoc" "tree-sitter-lua-patterns" "tree-sitter-lua" "tree-sitter-llvm" "tree-sitter-linkerscript" "tree-sitter-latex" "tree-sitter-kotlin" "tree-sitter-kdl" "tree-sitter-kconfig" "tree-sitter-just" "tree-sitter-julia" "tree-sitter-jsonnet" "tree-sitter-json" "tree-sitter-jsdoc" "tree-sitter-javascript" "tree-sitter-java-properties" "tree-sitter-java" "tree-sitter-janet" "tree-sitter-ini" "tree-sitter-hyprlang" "tree-sitter-html" "tree-sitter-hlsl" "tree-sitter-heex" "tree-sitter-hcl" "tree-sitter-haxe" "tree-sitter-haskell" "tree-sitter-hare" "tree-sitter-hack" "tree-sitter-gstlaunch" "tree-sitter-groovy" "tree-sitter-graphql" "tree-sitter-gpr" "tree-sitter-gosum" "tree-sitter-gomod" "tree-sitter-go" "tree-sitter-gn" "tree-sitter-glsl" "tree-sitter-gleam" "tree-sitter-gitignore" "tree-sitter-gitcommit" "tree-sitter-gitattributes" "tree-sitter-gdscript" "tree-sitter-func" "tree-sitter-fortran" "tree-sitter-fish" "tree-sitter-firrtl" "tree-sitter-f-sharp" "tree-sitter-erlang" "tree-sitter-embedded-template" "tree-sitter-elm" "tree-sitter-elixir" "tree-sitter-elisp" "tree-sitter-doxygen" "tree-sitter-dot" "tree-sitter-dockerfile" "tree-sitter-devicetree" "tree-sitter-dart" "tree-sitter-d" "tree-sitter-cypher" "tree-sitter-cuda" "tree-sitter-csv" "tree-sitter-css" "tree-sitter-cpp" "tree-sitter-cpon" "tree-sitter-comment" "tree-sitter-cmake" "tree-sitter-clojure" "tree-sitter-clisp" "tree-sitter-cli" "tree-sitter-clarity" "tree-sitter-chatito" "tree-sitter-capnp" "tree-sitter-cairo" "tree-sitter-c-sharp" "tree-sitter-c" "tree-sitter-blueprint" "tree-sitter-bitbake" "tree-sitter-bicep" "tree-sitter-bibtex" "tree-sitter-beancount" "tree-sitter-bash" "tree-sitter-awk" "tree-sitter-astro" "tree-sitter-asm" "tree-sitter-arduino" "tree-sitter-agda" "tree-sitter-ada" "tree-sitter-actionscript"
               ;; Dictionaries, spell-checkers, and grammar checkers.
               "hunspell-dict-en" "hunspell" "dictd"
               ;; Documentation.
               "texinfo" "info-reader"
               ;; Fonts.
               "fontconfig" "font-aporetic"
               ;; filesystems.
               "squashfs-tools" "squashfuse" "squashfuse-for-appimage" "fuse")))
    (services
      (append
        (list
         (service home-bash-service-type
                  (home-bash-configuration
                   (variables `(("HISTSIZE" . "1000000000")
                                ("HISTFILESIZE" . "$HISTSIZE")
                                ("PROMPT_COMMAND" . "${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r")
                                ("BASHOPTS" . ,(string-append "checkwinsize:"
                                                              "cmdhist:"
                                                              "complete_fullquote:"
                                                              "expand_aliases:"
                                                              "extglob:"
                                                              "extquote:"
                                                              "force_fignore:"
                                                              "globasciiranges:"
                                                              "globskipdots:"
                                                              "interactive_comments:"
                                                              "login_shell:"
                                                              "patsub_replacement:"
                                                              "progcomp:"
                                                              "promptvars:"
                                                              "sourcepath:"
                                                              "histappend:"
                                                              "no_empty_cmd_completion"))
                                ("FCEDIT")
                                ("HISTCONTROL" . "ignorespace")))
                   (aliases '(("grep" . "grep --color=auto")
                              ("ip" . "ip -color=auto")
                              ("ll" . "ls -l")
                              ("ls" . "ls -p --color=auto")))
                   (bashrc (list (local-file
                                  "/home/brody/guix-config//.bashrc"
                                  "bashrc")))
                   (bash-profile (list (local-file
                                        "/home/brody/guix-config//.bash_profile"
                                        "bash_profile")))
                   (bash-logout (list (local-file
                                       "/home/brody/guix-config//.bash_logout"
                                       "bash_logout")))))

         (service home-dbus-service-type)
         (service home-pipewire-service-type)

         (service home-files-service-type
                  `((".guile" ,%default-dotguile)
                    (".Xdefaults" ,%default-xdefaults)))

         (service home-xdg-configuration-files-service-type
                  `(("gdb/gdbinit" ,%default-gdbinit)
                    ("nano/nanorc" ,%default-nanorc)))

         (service home-gpg-agent-service-type
                  (home-gpg-agent-configuration
                   (ssh-support? #t)
                   (extra-content "allow-emacs-pinentry\nallow-loopback-pinentry\nwrite-env-file\nuse-standard-socket")))
         (service home-openssh-service-type
                  (home-openssh-configuration
                    (hosts (list
                            (openssh-host (name "*")
                                          (extra-content "ServerAliveInterval 120"))
                            (openssh-host (name "sdf.org")
                                          (host-name "sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "sdf tty.sdf.org")
                                          (host-name "tty.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "meta meta.sdf.org")
                                          (host-name "meta.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "ma ma.sdf.org")
                                          (host-name "ma.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "faeroes faeroes.sdf.org")
                                          (host-name "faeroes.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "iceland iceland.sdf.org")
                                          (host-name "iceland.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "sverige sverige.sdf.org")
                                          (host-name "sverige.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "miku miku.sdf.org")
                                          (host-name "miku.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "miku miku.sdf.org")
                                          (host-name "miku.sdf.org")
                                          (user "ryanbw")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "asimov asimov.home.ryanbw.org")
                                          (host-name "asimov.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t)
                                          (proxy (list (proxy-jump (host-name "hugo.home.ryanbw.org")
                                                                   (user "brody")
                                                                   (port 2222)))))
                            (openssh-host (name "asimov.local")
                                          (host-name "asimov.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "verne")
                                          (host-name "verne")
                                          (user "u0_a154")
                                          (port 8022))
                            (openssh-host (name "hoar hoar.local")
                                          (host-name "hoar")
                                          (user "brody"))
                            (openssh-host (name "shelley")
                                          (host-name "shelley")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t)
                                          (proxy (list (proxy-jump (host-name "hugo.home.ryanbw.org")
                                                                   (user "brody")
                                                                   (port 2222)))))
                            (openssh-host (name "shelley.local")
                                          (host-name "shelley")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "glass-wall glass-wall.tgfoffice.ryanbw.org")
                                          (host-name "glass-wall.tgfoffice.ryanbw.org")
                                          (user "security"))
                            (openssh-host (name "hugo hugo.home.ryanbw.org")
                                          (host-name "hugo.home.ryanbw.org")
                                          (user "brody")
                                          (port 2222))
                            (openssh-host (name "adams adams.home.ryanbw.org")
                                          (host-name "adams.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t)
                                          (proxy (list (proxy-jump (host-name "hugo.home.ryanbw.org")
                                                                   (user "brody")
                                                                   (port 2222)))))
                            (openssh-host (name "adams.local")
                                          (host-name "adams.home.ryanbw.org")
                                          (user "brody")
                                          (forward-x11? #t)
                                          (forward-x11-trusted? #t))
                            (openssh-host (name "github github.com")
                                          (host-name "github.com")
                                          (user "git"))))
                    (known-hosts *unspecified*)
                    (known-hosts2 (list
                                   (plain-file
                                    "hugo.ed25519"
                                    "[hugo.home.ryanbw.org]:2222,[home.ryanbw.org]:2222 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7ZcqphH8urTs0312v+nShHjrqdd3NGltTa57oHJBrn")
                                   (plain-file
                                    "asimov.ed25519"
                                    "asimov,asimov.home.ryanbw.org,asimov.local ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN+AiNOLM8OoGTw/9qFJhk7CKr3ycsAjtAh5qbMcWmgr")
                                   (plain-file
                                    "asimov.ecdsa"
                                    "asimov,asimov.home.ryanbw.org,asimov.local ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDy5d+Pt70jM9YCgaNL/HwSLOhUenlOwGgIBGGkGZr8i0O95NzblN5yCR6iFlgBNaSRsP0GxArNscgDUunrNBME=")
                                   (plain-file
                                    "asimov.rsa"
                                    "asimov,asimov.home.ryanbw.org,asimov.local ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyOK2RcYnoDEbCykJCzzNcFQYeTn57HX3+MJDoZ8tugn7xGDS1jxvyqtE2V89789tb6bu/XVkjt8UnHViDWvdVVrl+kDxMoU73Qe1sV7fHNHA+B+nMJksRPS28mbmtjGwu6k1FEHXQi+7X1hVlALE/F69/7RJuw316xSgBp8+rtj3fvHYc2LT8kWxn83XKF5pU8kcBX7l7W3Qw1nSqKmDRTYtbwEljuB/KSAEhGwJn1BjNGAl6CLHs8i8Kg9bRTOSEUK4YZFA4qcqagLX9iNaMxZAY5ypkqRzbgemROJtVZgPI61TYIBU1LzXH7SJpPHCm2D9pAHQSCNHGjKq6dNfCPzbO8IwB6EYhII/WJnstKrFRsqNw5c1y3gRVqeMOqc2j37MuHtWrXbuE5hBI/PHNznzIlut0ZnaZuciA288GTK0AJapdq/kv2CfRmF//RsP5GHy3MUtfXLuUFOk5A0TE01Nwr0vqQs3AnnJZOoVc5eYEHQ/jggNJ1C9Ib3IDwxk=")
                                   (plain-file
                                    "adams.ed25519"
                                    "adams,adams.home.ryanbw.org,adams.local ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBYFI6KeRoNtvkGCMACJmvRC7AaSzGVn49cl+fuHN2PK")
                                   (plain-file
                                    "adams.ecdsa"
                                    "adams,adams.home.ryanbw.org,adams.local ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDPW7iErqpJ7m8wWGTI0fV9f1NgbldH1kcoNjxANcsqQIHdATU7MowSKzToI4bFhuWkLofthrlCG7YkvyYWORo8=")
                                   (plain-file
                                    "shelley.ecdsa"
                                    "shelley,shelley.home.ryanbw.org,shelley.local ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBjmln6sNbtNTNCa89DrIyfOyJ5xfzo74jHm/XUeeKsMs3AqGW4z9gqi+zbUma7FQBKl+/io6vmaHkPOVE89xKk=")
                                   (plain-file
                                    "clockworkpi.ed22519"
                                    "clockworkpi-a06 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/Y/iS+7qsU2MiO3XRUuejQ5H6VHobGy+WTwiFC0ujo")
                                   (plain-file
                                    "clockworkpi.ecdsa"
                                    "clockworkpi-a06 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFXvydp9wtUofa5T69q0fF1GFe/D0kBhuO9a37P0QWuIOjC/E559rQVVRi5NW9ZwxDa3pgIExfuJHnxJhbFKkeA=")
                                   (plain-file
                                    "clockworkpi.rsa"
                                    "clockworkpi-a06 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCn7c0nK7zevvjjmsgh9rsX6e8EqXk9vfK0UvcsEXxiZSi9Pby0br+3/Ih9TVGtS/iXNJUijCxcOrrAdP7jecHA0YwA0XnEGDSCJ6D7rTvnK8rVcFGlqOK1hneNwcSaRjctY4qdur2CMePnapTvvIM59G3ogbbxObOEAyiwV1XxICH7vpAl0Bwn3w7zg08a8lPXyck7cHNTKxKzGXelz3Vp2Cv1AAiBaNhIsRWfiwSd/Y0CnJy4Sj79ixJzQDnvrUwz+N6GyDRVLeIshij891D1diMhAZX6F1tCBwBbqIYr9mFS2Pl2MNgF06G28FbJuPgz1qd3ovrAw2TLA3ZpYnypcLPtP9D8sUV26uD88hLtwIFpcZ39br93Tsd4JZfROkxDxqbp6ogsIHZHHQjLo0PsuZ670uP+Q6tyEaEKvejqR03OvDuy9kyIOsVbey3LSuqeU65zpOfjmsmwf/yDHhpcSKvlYbYE3PlLnKYZ3viQw8rITrOGblM6DvsIW876dvU=")
                                   (plain-file
                                    "glass-wall.ed25519"
                                    "glass-wall,glass-wall.tgfoffice.ryanbw.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMUhOA5M5a3FnlomXdfTtOPX6+Jvo9romx965rkG7weV")
                                   (plain-file
                                    "sdf.org.ed25519"
                                    "sdf.org,tty.sdf.org,meta.sdf.org,faeroes.sdf.org,iceland.sdf.org,sverige.sdf.org,miku.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJk3a190w/1TZkzVKORvz/kwyKmFY144lVeDFm80p17")
                                   (plain-file
                                    "ma.sdf.org.ed25519"
                                    "ma.sdf.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBYd/fxnh/aZm2mAvZyCJn23A8sN7I8VZamIbamWtm/z")
                                   (plain-file
                                    "ma.sdf.org.rsa"
                                    "ma.sdf.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCZnLf53oW9TGxXOsAPFtSeygukVQTHWNdOsV5WFK5HCbDjpJWdSD+YL9vWMdFUybJGgizrs4poiR0YIikqUjdS1GUJiL+JN61sOJJ678X75yON0Hdky9BPqOLiIx4hcih6VQMDQysXyYRGlouTUYbNNCK3GokbmnpuYniGfqF8lDZ6MovIBiGRtvdt6DOq2PYcqNo8l9a6S46Z4mHFgdXTkMtJxcHg1wOjzuYBEZCDt7TpuWBcf3kYRaLZdKzniV1ACLQ1BK7h2AkXUoLpll2628VKY3jqFWILk0O1dV7VhWK9Gu4pNG45jfLWDwNe0cJbresU+TEYOqUXOfibFgYVhjVGV55Ztk0ochfFi+EM8v2Z1wdyouoWBRgk1HWauAJJLOL5HodF88XQi47+x2cqBj4bLMNk5aVn44q6Ff03iLVHX27Svg6nwiCYdkd8LD8okUudxO/Dw/NEYXvLoHSxaZgjrcp4BLZ6kj4rNgIuhVAUiAj2LySnah/TR15sug8=")
                                   (plain-file
                                    "ma.sdf.org.ecdsa"
                                    "ma.sdf.org ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKChFj75RhAAwW/yQBLFZTBwLNJ6C3/DjCpZz+ATTea5RiVQ+/YMpED0GZ+877Tx0XXCbARjN0cLhWrOlPc8tCQ=")
                                   (plain-file
                                    "github.com.ed25519"
                                    "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl")
                                   (plain-file
                                    "github.com.ecdsa"
                                    "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=")
                                   (plain-file
                                    "github.com.rsa"
                                    "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=")
                                   (plain-file
                                    "gitlab.com.ed25519"
                                    "gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf")
                                   (plain-file
                                    "gitlab.com.ecdsa"
                                    "gitlab.com,2606:4700:90:0:f22e:fbec:5bed:a9b9 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=")
                                   (plain-file
                                    "sfo2.tmate.io"
                                    "sfo2.tmate.io ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTnCMAanvAYXe8RSbSgpz2agNiU2i2Y2ryPWeFx+yh473Aj0zW6x/BzApOn5k4qiPmf8LOVSIk5hL01W8l2y5yHC2CXFyBpQuc/uNZzLpAxrvTSVN1rp7hu3dR5keybHFdd8SEWlPI4m9vPYUVqXMrXBjfsSZxeYOUKNav3aWWPGtO19KhmCdMbIZx3PN0QvklhkJ2ElRZO7uiACvvCWS8LOo3ht/Y6QdGIfQqTX3DJlFXwfvnoqhlmV8LGVKk/y6jtqPmmengEEHtvRcH92LzBIR5e0NQj+5/WDHquh1p9xiaA3TZD6zStWSrbqFovm7aAAM9WKfb866WkUK1HlNv")))
                    (authorized-keys (list
                                      ;; Personal Yubikey.
                                      (plain-file
                                       "personal-yubikey.rsa"
                                       "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8DFytpc6sozHtEwBMf3dnId+pxWJkuKNYWaAGZgEf+pm56G/sxzKN1oUw67ja4i+t9/w11jXZNFMVCtG33HgqkzSevk0itJ+q60cML/ZlX4J7dSup8kT8Bqjyr2Nqd5SVTRu2DWQ27kHLq/40xheGlWdjEnF6r5n5Rmeday45lIh8UPqkCXd41Y8YqZI8wKvr2LHwsd4jShaNrizWJ7lOX2DDgvBkZCBXwPXueue+wXVP1jwPvfBStRP67jPNKl4IoNVfgkESNM8/uGeoknVBV7mELmEHq4rcp3G9KUSpeHCfLcz7KXX+uSweBY0Wm7wbGJlFK19cVfuPAeAj0G5oVowkbIvpVgPBMPayliNxjpyUefGUmnqVYcDcZgf5LhaJfGdfn7jcpGoSL1F2OgOa+QFAv5UjfLT1nzKj2TL+lnvj+T+mK+awFb1jPKCu6NfIYKGIynH7fSVcdxPnwwYZoU7XZLBQDH1z9EweUjzPnmnk9goJERAJLWr457DOnSOtAe4G6AHALY7pjxfLRxoIhW7pnXQJvq9a2kJpU8VmMsxa8UKDMPJBZaLKMZcslAVo2kQN8haKXsCG53tkNxc9mCj8M9JM3y15Wy05X9803PGMkOtH3SWDBiWD69lwqOVjxU7actgwcjS4m83yidamkEKSmDVEJeCG/UWiu1uqlQ== cardno:000607082686")
                                      ;; Personal computers and devices keyfiles.
                                      ;;(plain-file "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC542y3gp2Q4JMD82p6HTNUB9uZ9xu3TAnRWP4YaLqvzSpAd3Bx1LK/U4e4A+0KdDuGjOz8tjhdvD2jYxpBeIO3TaMK+xhf8So6+2uEfvuNNXL0og0pntyNxTdo4cvszw0WTyzo/yaNf+Fc0ZhC67uinUHvRkcNxI3NPXuY9bHpxYgqSu3Bvuynj/9cTUGEUlZdW7hf7dNdT9xnGZMynNwPOmwCCNHV0gET80pejPnpgac7VH6VecIfSUtlYcUarawIMVj9IozFdFRYlkunAYp/2tt/qmGawo95EoS6Ze+pA88ot5rCgwwAqXcrs8ul9mgefg0lK4oqcVyur6ic1oNF brody@asimov.home.ryanbw.org")
                                      ;;(plain-file "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2fvc4VTUfA46B2eC9qMrquvLhR8VOEMRu5fanKZXloGb010EviveUTHh2PuMi0B7Y+RW39Tullg6/wXTQC2XZSwvrWqBM/qoaXmP3tfNjg8Ajg8MthInDNaHUSXMOwo936wCi7SyX0jOz+o+AFtJ6nqtIYsnnZIS7HXCPOJIKmVyYbMaF0ot7XwXEjG2wxu3wjzHmZb4fa0vTd8qE4HsPPBD34WFgte2sUFBH6TUqzTKnGvEq0nJP5WubZe5jJCsaQ9h6WyYsc4pHUMrijhv2YfBli3UZgSVeFrENyR95Ia3fsbQpIiAauftd+cHZVVOXC2RJzBypvuzwBdkxaror brody@shelley.home.ryanbw.org")
                                      ;;(plain-file "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdRmy5aaO3kUmk8qh5wNAjPbOgzE7bf58kdVvrmGOvykgG4ZZL2wCRwcMkVAkTzOt7ER6UrHFM7CflQYOh+0aJgzC/hLBUQqtL6Y0+yzwi1fgYQt1UGzchwvHvBAnE0JuE07xJlq7D5JmkeevpWMwC9Dx90YwqFt0c4dJMdUerH2uSSaC/oqIbSOpO56O2Nn4+DCUWMMHAA/AfSNYKUG8Dj6eUBkDIOjDU37SPO05g7aIUhdjoxTLmwy1Z/eVmXzfh5yP/NJBaFCEoTbrFpOZnIGfaa0R+x0wsjGxxp6aiuEBA0pxO6xM/M1Pi0JIkdCsfpaLPQnVL9V0x7q7uOIUH brody@phone.mobile.ryanbw.org")
                                      ;;(plain-file "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+8E3DepSvDHQjTNrim07bZqgX/uFwQrOmZp/PHDDF4jCnBVYMqT3n7yWzH2eaZzhegB4GPt23Bmo5HB+nRUcj1qPNATenXBxIk2IoIPPq21dIPlKmKQyXKXCkjtlo/gXuvLRy6aj0B16hVN0NDFuRZ/wEAseXLMxg3Gln5/lalzNRt/VwhS2VBlRPJnnIGLXTOb52AmXDBZPbkfUYYE+mOC76ySA8NrL/rrOLwZXCezq2J+sskvA2+XAhqTdZi8dk23TpviY8qtNpoj3QXJrS+G5zFVhyeAr8rPCAbAgYwuCaPk82t35YTlsIj0Nxqlqo01s4HwLcHyXUiAWtltObWmt8dNc6v8wnWt5kAtcglnX/bF0SqkUPo33421f+ZLkWbIu6xeudTilDnTbLf6YXNcbss+g4BtwR3dvadzbVDqdGW7CPd2zSZZcaxQtIFX4wu/MYE5ZwY26/b37/dVhimJHObvwSJRHMl2vS8Vg0pKqyhs8LEpW1O4BmV4Fkaj+BwTIJBvVnTtKA8no8NUtZPPcjkuA1nHmrZhDB+em9liHDOPziDKk4slYyV7fBRo5lJfB8j3ElrLHyOwWzit706PLsJqVosBkh7Ha4Jq0QJr/ohh/hOC81b8eCO5BzCjYdpg9FaaZ9hOWRk1KwzKqAu74S1DnW5e+k59mHtjrqGQ== Brody's OnePlus 7 Pro")
                                      ))
                    (add-keys-to-agent "confirm"))))

        %base-home-services))))

home-config
